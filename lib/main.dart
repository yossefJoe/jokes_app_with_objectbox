import 'package:figner_print_auth/core/utils/constants/themes.dart';
import 'package:figner_print_auth/core/utils/resources/app_router.dart';
import 'package:figner_print_auth/core/utils/resources/notification_service.dart';
import 'package:figner_print_auth/features/home/presentation/manager/categories_cubit/categories_cubit.dart';
import 'package:figner_print_auth/features/home/presentation/manager/jokes_by_category_cubit/jokes_by_category_cubit.dart';
import 'package:figner_print_auth/features/home/presentation/manager/popular_jokes_cubit/popular_jokes_cubit.dart';
import 'package:figner_print_auth/features/profile/data/models/objectbox.dart';
import 'package:figner_print_auth/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import "/core/utils/resources/service_locator.dart" as di;

late final ObjectBox objectBox; // Make it globally accessible

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init(); // Initialize GetStorage
  await di.init();
  objectBox = await ObjectBox.create();
  await requestNotificationPermission();
  const AndroidInitializationSettings androidSettings =
      AndroidInitializationSettings('@mipmap/ic_launcher');
  const InitializationSettings initializationSettings = InitializationSettings(
    android: androidSettings,
  );

  await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  await initializeService();
  runApp(ProviderScope(child: MyApp(objectBox: objectBox)));
}

Future<void> requestNotificationPermission() async {
  final permissionStatus = await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          IOSFlutterLocalNotificationsPlugin>()
      ?.requestPermissions(
        alert: true,
        badge: true,
        sound: true,
      );
  print("Notification Permission: $permissionStatus");
}

Future<void> initializeService() async {
  final service = FlutterBackgroundService();

  await service.configure(
    androidConfiguration: AndroidConfiguration(
      onStart: onStart,
      isForegroundMode: true,
      autoStart: true,
      notificationChannelId: 'joke_channel',
      initialNotificationTitle: 'Joke Notifier',
      initialNotificationContent: 'Fetching jokes every minute...',
    ),
    iosConfiguration: IosConfiguration(),
  );

  await flutterLocalNotificationsPlugin.initialize(
    const InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
    ),
  );

  service.startService();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.objectBox});
  final ObjectBox objectBox; // ✅ Define ObjectBox parameter

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => di.getIt<CategoriesCubit>()..getCategories(),
          ),
          BlocProvider(
            create: (context) =>
                di.getIt<PopularJokesCubit>()..getPopularJokes(),
          ),
          BlocProvider(
            create: (context) =>
                di.getIt<JokesByCategoryCubit>()..getJokesByCategory(),
          ),
        ],
        child: MaterialApp.router(
            routerConfig: AppRouter.router,
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ProjectThemes.lightTheme),
      ),
    );
  }
}
