import 'package:bloc/bloc.dart';
import 'package:figner_print_auth/features/home/data/repos/home_repo.dart';
import 'package:figner_print_auth/features/home/presentation/manager/popular_jokes_cubit/popular_jokes_state.dart';

class PopularJokesCubit extends Cubit<PopularJokesState> {
  PopularJokesCubit(this.homeRepo) : super(PopularJokesInitial());

  final HomeRepo homeRepo;

  Future<void> getPopularJokes() async {
    emit(PopularJokesLoading());
    try {
      var result = await homeRepo.getPopularJokes();
      result.fold(
        (failure) {
          emit(PopularJokesFailure(failure.errMessage));
        },
        (success) {
          emit(PopularJokesSuccess(
            success
          ));
        },
      );
    } catch (e) {
      emit(const PopularJokesFailure('An unexpected error occurred.'));
    }
  }
}
