import 'package:dio/dio.dart';
import 'package:figner_print_auth/features/home/data/repos/home_repo_impl.dart';
import 'package:figner_print_auth/features/home/presentation/manager/categories_cubit/categories_cubit.dart';
import 'package:figner_print_auth/features/home/presentation/manager/jokes_by_category_cubit/jokes_by_category_cubit.dart';
import 'package:figner_print_auth/features/home/presentation/manager/popular_jokes_cubit/popular_jokes_cubit.dart';
import 'package:get_it/get_it.dart';
import 'api_service.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));

  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(
    getIt.get<ApiService>(),
  ));
  getIt.registerSingleton(CategoriesCubit(getIt.get<HomeRepoImpl>()));
  getIt.registerSingleton(PopularJokesCubit(getIt.get<HomeRepoImpl>()));
  getIt.registerSingleton(JokesByCategoryCubit(getIt.get<HomeRepoImpl>()));
}
