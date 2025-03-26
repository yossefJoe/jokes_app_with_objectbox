import 'package:dartz/dartz.dart';
import 'package:figner_print_auth/core/errors/failures.dart';
import 'package:figner_print_auth/features/home/data/models/categories_model.dart';
import 'package:figner_print_auth/features/home/data/models/jokes_model.dart';

abstract class HomeRepo{
  Future<Either<Failure, CategoriesModel>> getCategories();
  Future<Either<Failure, List<JokesModel>>> getPopularJokes();
}