import 'package:equatable/equatable.dart';
import 'package:figner_print_auth/features/home/data/models/categories_model.dart';


abstract class CategoriesState extends Equatable {
  const CategoriesState();

  @override
  List<Object> get props => [];
}

class CategoriesInitial extends CategoriesState {}

class CategoriesLoading extends CategoriesState {}

class CategoriesFailure extends CategoriesState {
  final String errMessage;

  const CategoriesFailure(this.errMessage);
}

class CategoriesSuccess extends CategoriesState {
  final CategoriesModel categories;

  const CategoriesSuccess(this.categories);
}
