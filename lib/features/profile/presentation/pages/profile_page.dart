import 'package:figner_print_auth/features/home/data/models/jokes_model.dart';
import 'package:figner_print_auth/features/home/presentation/widgets/joke_modal_bottom_sheet.dart';
import 'package:figner_print_auth/features/profile/data/models/objectbox.dart';
import 'package:figner_print_auth/features/profile/data/models/objectbox_model.dart';
import 'package:figner_print_auth/main.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<Joke> getFavoriteJokes(ObjectBox objectBox) {
    return objectBox.jokeBox.getAll();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              itemCount: getFavoriteJokes(objectBox).length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => showJokeModalBottomSheet(
                      context,
                      JokesModel(
                        category: getFavoriteJokes(objectBox)[index].category,
                        type: getFavoriteJokes(objectBox)[index].type,
                        joke: getFavoriteJokes(objectBox)[index].joke,
                        id: getFavoriteJokes(objectBox)[index].id,
                        safe: getFavoriteJokes(objectBox)[index].safe,
                        lang: getFavoriteJokes(objectBox)[index].lang,
                        setup: getFavoriteJokes(objectBox)[index].setup,
                        delivery: getFavoriteJokes(objectBox)[index].delivery,
                      )),
                  child: Column(
                    children: [
                      Text(getFavoriteJokes(objectBox)[index].setup ?? ''),
                      Text(getFavoriteJokes(objectBox)[index]
                              .jokeId
                              .toString() ??
                          ''),
                    ],
                  ),
                );
              },
            ),
          ),
        )
      ],
    );
  }
}
