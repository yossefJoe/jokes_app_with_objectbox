import 'package:equatable/equatable.dart';
import 'package:figner_print_auth/features/home/data/models/jokes_model.dart';


abstract class PopularJokesState extends Equatable {
  const PopularJokesState();

  @override
  List<Object> get props => [];
}

class PopularJokesInitial extends PopularJokesState {}

class PopularJokesLoading extends PopularJokesState {}

class PopularJokesFailure extends PopularJokesState {
  final String errMessage;

  const PopularJokesFailure(this.errMessage);
}

class PopularJokesSuccess extends PopularJokesState {
  final List<JokesModel> PopularJokes;

  const PopularJokesSuccess(this.PopularJokes);
}
