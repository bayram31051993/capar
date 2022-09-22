
import 'package:capar/app/data/services/storage_provider.dart';

import 'enums.dart';

abstract class Suggestor {
  static List<String> returnSuggestions(enmStorageKeys type, String typing) {
    List<String> all = PrvStorage().getListValues(type);

    if (all.isNotEmpty) {
      return all
          .where((el) => el.toLowerCase().startsWith(typing.toLowerCase()))
          .toList();
    } else {
      return all;
    }
  }

  static writeToMemory(enmStorageKeys type, String value) {
    PrvStorage().addToList(type, value);
  }
}
