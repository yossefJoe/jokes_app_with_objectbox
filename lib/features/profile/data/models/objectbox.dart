import 'package:figner_print_auth/features/profile/data/models/objectbox.g.dart';
import 'package:figner_print_auth/features/profile/data/models/objectbox_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:objectbox/objectbox.dart';

class ObjectBox {
  late final Store store;
  late final Box<Joke> jokeBox;

  ObjectBox._create(this.store) {
    jokeBox = Box<Joke>(store);
  }

  static Future<ObjectBox> create() async {
    // ✅ Get the application documents directory
    final appDir = await getApplicationDocumentsDirectory();

    // ✅ Use the directory for ObjectBox storage
    final store = await openStore(directory: '${appDir.path}/objectbox');

    return ObjectBox._create(store);
  }
}
