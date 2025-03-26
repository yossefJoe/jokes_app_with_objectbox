import 'package:bloc/bloc.dart';
import 'package:figner_print_auth/features/home/data/repos/home_repo.dart';
import 'package:figner_print_auth/features/home/presentation/manager/categories_cubit/categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit(this.homeRepo) : super(CategoriesInitial());

  final HomeRepo homeRepo;

  Future<void> getCategories() async {
    emit(CategoriesLoading());
    try {
      var result = await homeRepo.getCategories();
      result.fold(
        (failure) {
          emit(CategoriesFailure(failure.errMessage));
        },
        (success) {
          emit(CategoriesSuccess(success));
        },
      );
    } catch (e) {
      emit(const CategoriesFailure('An unexpected error occurred.'));
    }
  }
}
