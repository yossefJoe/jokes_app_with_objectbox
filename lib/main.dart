import 'package:figner_print_auth/core/utils/constants/themes.dart';
import 'package:figner_print_auth/core/utils/resources/app_router.dart';
import 'package:figner_print_auth/features/home/presentation/manager/categories_cubit/categories_cubit.dart';
import 'package:figner_print_auth/features/home/presentation/manager/popular_jokes_cubit/popular_jokes_cubit.dart';
import 'package:figner_print_auth/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import "/core/utils/resources/service_locator.dart" as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init(); // Initialize GetStorage
  await di.init();
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
