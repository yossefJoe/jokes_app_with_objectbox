import 'package:figner_print_auth/core/utils/constants/styles.dart';
import 'package:figner_print_auth/core/utils/resources/color_manager.dart';
import 'package:figner_print_auth/features/home/data/models/jokes_model.dart';
import 'package:figner_print_auth/features/home/presentation/widgets/joke_modal_bottom_sheet.dart';
import 'package:figner_print_auth/features/profile/presentation/widgets/favourite_widget.dart';
import 'package:figner_print_auth/main.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeCarousel extends StatelessWidget {
  const HomeCarousel(
      {super.key,
      this.jokes,
      required this.images,
      required this.type,
      this.categories});
  final List<JokesModel>? jokes;
  final List<String>? categories;
  final List<String> images;
  final String type;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: type == "jokes" ? jokes!.length : categories!.length,
          itemBuilder: (context, index, realIndex) {
            return GestureDetector(
              onTap: () => type == "jokes"
                  ? showJokeModalBottomSheet(context, jokes![index])
                  : null,
              child: Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(20),
                        width: 180.w,
                        height: type == 'jokes'
                            ? 180.h
                            : 130.h, // Ensure height is set
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image:
                                AssetImage(images[index]), // ✅ Correct indexing
                            fit: BoxFit.fill,
                          ),
                        ),
                        child: Align(
                            alignment: Alignment.bottomCenter,
                            child: type == "jokes"
                                ? Text(
                                    ((jokes?[index].type ?? '') == 'twopart'
                                        ? jokes![index].setup ?? ''
                                        : jokes![index].joke ?? ''),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: Styles.textStyle12.copyWith(
                                        color: ColorManager.whiteColor),
                                  )
                                : null),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      type == 'jokes'
                          ? SizedBox.shrink()
                          : Text(
                              categories?[index] ?? '',
                              style: Styles.textStyle16,
                            ),
                    ],
                  ),
                  type != 'jokes'
                      ? SizedBox.shrink()
                      : Positioned(
                          top: 10.h,
                          right: 5.h,
                          child: FavouriteWidget(
                              objectBox: objectBox,
                              jokeModel: jokes?[index] ?? JokesModel()),
                        )
                ],
              ),
            );
          },
          options: CarouselOptions(
            height: type == 'jokes' ? 300.h : 250.h,
            aspectRatio: 2,
            viewportFraction: 0.6,
            initialPage: 0,
            enableInfiniteScroll: true,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            enlargeFactor: 0.4,
            onPageChanged: (index, reason) {
              print("Page changed to: $index");
            },
            scrollDirection: Axis.horizontal,
          ),
        ),
      ],
    );
  }
}
