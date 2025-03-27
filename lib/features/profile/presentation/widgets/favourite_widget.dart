import 'package:figner_print_auth/core/utils/resources/color_manager.dart';
import 'package:figner_print_auth/features/home/data/models/jokes_model.dart';
import 'package:figner_print_auth/features/profile/data/models/objectbox.dart';
import 'package:figner_print_auth/features/profile/data/models/objectbox.g.dart';
import 'package:figner_print_auth/features/profile/data/models/objectbox_model.dart';
import 'package:flutter/material.dart';

class FavouriteWidget extends StatefulWidget {
  final ObjectBox objectBox; // ✅ Pass ObjectBox instance
  final JokesModel jokeModel; // ✅ Pass JokesModel instance

  const FavouriteWidget({
    super.key,
    required this.objectBox,
    required this.jokeModel,
  });

  @override
  State<FavouriteWidget> createState() => _FavouriteWidgetState();
}

class _FavouriteWidgetState extends State<FavouriteWidget> {
  late bool isFavourite;

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < widget.objectBox.jokeBox.getAll().length; i++) {
      print(widget.objectBox.jokeBox.getAll()[i].jokeId);
    }
    isFavourite = _isJokeFavourite();
  }

  /// ✅ Check if the joke is already in favorites
  bool _isJokeFavourite() {
    return widget.objectBox.jokeBox
        .getAll()
        .any((joke) => joke.jokeId == widget.jokeModel.id);
  }

  /// ✅ Save joke to ObjectBox
  void _saveFavoriteJoke() {
    final joke = Joke(
      category: widget.jokeModel.category,
      joke: widget.jokeModel.joke,
      setup: widget.jokeModel.setup,
      delivery: widget.jokeModel.delivery,
      jokeId: widget.jokeModel.id, // ✅ Use correct jokeId
      type: widget.jokeModel.type,
      safe: widget.jokeModel.safe,
    );

    widget.objectBox.jokeBox.put(joke); // ✅ Save joke
    print("Joke saved: ${joke.joke}");

    setState(() {
      isFavourite = true; // ✅ Update state to reflect the change
    });
  }

  void deleteFavoriteJoke(ObjectBox objectBox, int jokeId) {
    // Find the joke using jokeId instead of primary key
    var jokeList =
        objectBox.jokeBox.getAll().where((j) => j.jokeId == jokeId).toList();

    var joke = jokeList.first; // Get the first matching joke
    objectBox.jokeBox.remove(joke.id); // Remove using the ObjectBox primary key

    if (mounted) {
      setState(() {
        isFavourite = false;
      });
    }

    print("Joke deleted successfully.");
  }

  @override
  Widget build(BuildContext context) {
    return isFavourite
        ? IconButton(
            onPressed: () =>
                deleteFavoriteJoke(widget.objectBox, widget.jokeModel.id ?? 0),
            icon: Icon(Icons.favorite, color: ColorManager.goldcolor),
          )
        : IconButton(
            onPressed: _saveFavoriteJoke,
            icon: const Icon(Icons.favorite_border,
                color: ColorManager.whiteColor),
          );
  }
}
