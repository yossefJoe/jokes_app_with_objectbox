import 'package:bloc/bloc.dart';
import 'package:figner_print_auth/features/home/data/repos/home_repo.dart';
import 'package:figner_print_auth/features/home/presentation/manager/jokes_by_category_cubit/jokes_by_category_state.dart';

class JokesByCategoryCubit extends Cubit<JokesByCategoryState> {
  JokesByCategoryCubit(this.homeRepo) : super(JokesByCategoryInitial());

  final HomeRepo homeRepo;
  int amount = 10;
  String category = 'Any';
  Future<void> getJokesByCategory() async {
    emit(JokesByCategoryLoading());
    try {
      var result = await homeRepo.getJokesByCategory(
        category,
        amount,
      );
      result.fold(
        (failure) {
          emit(JokesByCategoryFailure(failure.errMessage));
        },
        (success) {
          emit(JokesByCategorySuccess(success));
        },
      );
    } catch (e) {
      emit(const JokesByCategoryFailure('An unexpected error occurred.'));
    }
  }
}
