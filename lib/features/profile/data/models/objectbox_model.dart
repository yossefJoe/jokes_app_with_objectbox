import 'package:objectbox/objectbox.dart';

@Entity()
class Joke {
  @Id()
  int id = 0; // ObjectBox requires an ID field

  String? category;
  String? type;
  String? joke;
  int? jokeId;
  bool? safe;
  String? lang;
  String? setup;
  String? delivery;

  Joke({
    this.type,
    this.jokeId,
    this.category,
    this.joke,
    this.safe,
    this.lang,
    this.setup,
    this.delivery,
  });
}
