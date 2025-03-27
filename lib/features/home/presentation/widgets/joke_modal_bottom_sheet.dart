import 'package:figner_print_auth/core/utils/constants/styles.dart';
import 'package:figner_print_auth/core/utils/resources/assets.dart';
import 'package:figner_print_auth/core/utils/resources/color_manager.dart';
import 'package:figner_print_auth/features/home/data/models/jokes_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void showJokeModalBottomSheet(BuildContext context, JokesModel joke) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return JokeModalBottomSheet(
        joke: joke,
      );
    },
  );
}

class JokeModalBottomSheet extends StatefulWidget {
  const JokeModalBottomSheet({super.key, required this.joke});
  final JokesModel joke;

  @override
  State<JokeModalBottomSheet> createState() => _JokeModalBottomSheetState();
}

class _JokeModalBottomSheetState extends State<JokeModalBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Smile Whatever Happens",
              style:
                  Styles.textStyle18.copyWith(color: ColorManager.mainColor)),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 100.h,
            width: 100.w,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage(
                      Assets.assetsImagesHaveaniceday,
                    ),
                    fit: BoxFit.cover)),
          ),
          SizedBox(
            height: 10,
          ),
          _buildJokeText(widget.joke),
        ],
      ),
    );
  }

  Widget _buildJokeText(JokesModel joke) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          joke.category ?? '',
          style: Styles.textStyle16.copyWith(color: ColorManager.black),
        ),
        SizedBox(
          height: 10,
        ),
        joke.type == 'twopart'
            ? Column(
                children: [
                  Text(
                    textAlign: TextAlign.start,
                    joke.setup ?? '',
                    style: Styles.textStyle16
                        .copyWith(color: ColorManager.setupcolor),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    textAlign: TextAlign.start,
                    joke.delivery ?? '',
                    style: Styles.textStyle16
                        .copyWith(color: ColorManager.deliverycolor),
                  ),
                ],
              )
            : Text(
                textAlign: TextAlign.start,
                joke.joke ?? '',
                style:
                    Styles.textStyle16.copyWith(color: ColorManager.jokecolor),
              ),
      ],
    );
  }
}
