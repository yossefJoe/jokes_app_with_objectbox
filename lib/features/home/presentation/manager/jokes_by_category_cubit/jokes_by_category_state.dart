import 'package:equatable/equatable.dart';
import 'package:figner_print_auth/features/home/data/models/jokes_model.dart';


abstract class JokesByCategoryState extends Equatable {
  const JokesByCategoryState();

  @override
  List<Object> get props => [];
}

class JokesByCategoryInitial extends JokesByCategoryState {}

class JokesByCategoryLoading extends JokesByCategoryState {}

class JokesByCategoryFailure extends JokesByCategoryState {
  final String errMessage;

  const JokesByCategoryFailure(this.errMessage);
}

class JokesByCategorySuccess extends JokesByCategoryState {
  final List<JokesModel> JokesByCategory;

  const JokesByCategorySuccess(this.JokesByCategory);
}
