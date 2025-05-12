import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:figner_print_auth/core/errors/failures.dart';
import 'package:figner_print_auth/core/utils/resources/api_service.dart';
import 'package:figner_print_auth/core/utils/resources/constant_api.dart';
import 'package:figner_print_auth/features/home/data/models/categories_model.dart';
import 'package:figner_print_auth/features/home/data/models/jokes_model.dart';
import 'package:figner_print_auth/features/home/data/repos/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;
  HomeRepoImpl(this.apiService);
  @override
  Future<Either<Failure, CategoriesModel>> getCategories() async {
    String endPoint = ConstantApi.categories;
    Map<String, dynamic> data = await apiService.get(endPoint: endPoint);
    try {
      return right(CategoriesModel.fromJson(data));
    } catch (e) {
      if (e is DioError) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<JokesModel>>> getPopularJokes() async {
    try {
      String endPoint =
          '${ConstantApi.popularJokes}?amount=5'; // ✅ Ensure 'amount'
      final data = await apiService.get(endPoint: endPoint);

      print("API Response: $data"); // ✅ Debugging

      if (data.containsKey('jokes') && data['jokes'] is List) {
        // ✅ Convert "jokes" list correctly
        return right((data['jokes'] as List)
            .map((e) => JokesModel.fromJson(e as Map<String, dynamic>))
            .toList());
      }

      return left(ServerFailure("Unexpected response format: $data"));
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<JokesModel>>> getJokesByCategory(
      String category,int amount) async{
    try {
      String endPoint =
          '${ConstantApi.jokes}$category?amount=$amount'; // ✅ Ensure 'amount'
      final data = await apiService.get(endPoint: endPoint);

      print("API Response: $data"); // ✅ Debugging

      if (data.containsKey('jokes') && data['jokes'] is List) {
        // ✅ Convert "jokes" list correctly
        return right((data['jokes'] as List)
            .map((e) => JokesModel.fromJson(e as Map<String, dynamic>))
            .toList());
      }

      return left(ServerFailure("Unexpected response format: $data"));
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
