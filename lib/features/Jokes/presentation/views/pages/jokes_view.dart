import 'package:figner_print_auth/core/utils/constants/styles.dart';
import 'package:figner_print_auth/core/utils/resources/color_manager.dart';
import 'package:figner_print_auth/features/home/presentation/manager/categories_cubit/categories_cubit.dart';
import 'package:figner_print_auth/features/home/presentation/manager/categories_cubit/categories_state.dart';
import 'package:figner_print_auth/features/home/presentation/manager/jokes_by_category_cubit/jokes_by_category_cubit.dart';
import 'package:figner_print_auth/features/home/presentation/manager/jokes_by_category_cubit/jokes_by_category_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class JokesView extends StatelessWidget {
  const JokesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorManager.mainColor,
        title: Text(
          'Jokes',
          style: Styles.textStyle20.copyWith(color: ColorManager.whiteColor),
        ),
        actions: [
          // Text('Type'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: BlocBuilder<CategoriesCubit, CategoriesState>(
              builder: (context, state) {
                if (state is CategoriesSuccess) {
                  return PopupMenuButton(
                    itemBuilder: (context) {
                      return state.categories.categories
                              ?.map((e) => PopupMenuItem(
                                    child: Text(e),
                                    value: e,
                                    onTap: () {
                                      BlocProvider.of<JokesByCategoryCubit>(
                                              context)
                                          .category = e;
                                      BlocProvider.of<JokesByCategoryCubit>(
                                              context)
                                          .getJokesByCategory();
                                    },
                                  ))
                              .toList() ??
                          [];
                    },
                  );
                }
                if (state is CategoriesFailure) {
                  return const Text('Error');
                }
                return const SizedBox.shrink();
              },
            ),
          )
        ],
        centerTitle: true,
      ),
      body: Center(
        child: BlocBuilder<JokesByCategoryCubit, JokesByCategoryState>(
          builder: (context, state) {
            if (state is JokesByCategorySuccess) {
              return ListView.builder(
                itemCount: state.JokesByCategory.length,
                itemBuilder: (context, index) {
                  return Text(state.JokesByCategory[index].delivery ?? "");
                },
              );
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
