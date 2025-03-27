import 'package:figner_print_auth/core/utils/constants/styles.dart';
import 'package:figner_print_auth/core/utils/resources/assets.dart';
import 'package:figner_print_auth/core/utils/resources/color_manager.dart';
import 'package:figner_print_auth/core/widgets/custom_carusol.dart';
import 'package:figner_print_auth/features/home/presentation/manager/categories_cubit/categories_cubit.dart';
import 'package:figner_print_auth/features/home/presentation/manager/categories_cubit/categories_state.dart';
import 'package:figner_print_auth/features/home/presentation/manager/popular_jokes_cubit/popular_jokes_cubit.dart';
import 'package:figner_print_auth/features/home/presentation/manager/popular_jokes_cubit/popular_jokes_state.dart';
import 'package:figner_print_auth/features/home/presentation/widgets/joke_modal_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> images = [
    Assets.assetsImagesMisc,
    Assets.assetsImagesProgramming,
    Assets.assetsImagesDark,
    Assets.assetsImagesPun,
    Assets.assetsImagesSpooky,
    Assets.assetsImagesChris,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'Smile',
                    style: Styles.textStyle30.copyWith(color: Colors.green),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text("Categories", style: Styles.textStyle20),
                SizedBox(
                  height: 20,
                ),
                BlocBuilder<CategoriesCubit, CategoriesState>(
                  builder: (context, state) {
                    if (state is CategoriesLoading) {
                      return const Center(
                          child: CircularProgressIndicator(
                        color: ColorManager.mainColor,
                      ));
                    } else if (state is CategoriesFailure) {
                      return Center(child: Text(state.errMessage));
                    } else if (state is CategoriesSuccess) {
                      final categories = state.categories.categories
                              ?.where(
                                (element) => element != 'Any',
                              )
                              .toList() ??
                          [];
                      return HomeCarousel(
                        type: "categories",
                        images: images,
                        categories: categories,
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
                Text("Popular Jokes", style: Styles.textStyle20),
                SizedBox(
                  height: 20,
                ),
                BlocBuilder<PopularJokesCubit, PopularJokesState>(
                  builder: (context, state) {
                    if (state is PopularJokesLoading) {
                      return const Center(
                          child: CircularProgressIndicator(
                        color: Colors.green,
                      ));
                    } else if (state is PopularJokesFailure) {
                      print("error :" + state.errMessage);
                      return Center(child: Text(state.errMessage));
                    } else if (state is PopularJokesSuccess) {
                      final popularJokes = state.PopularJokes;
                      List<String> Popular = List.generate(popularJokes.length,
                          (index) => Assets.assetsImagesSmile);
                      return HomeCarousel(
                        type: "jokes",
                        images: Popular,
                        jokes: popularJokes,
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
