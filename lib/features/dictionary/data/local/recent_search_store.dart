import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

// class RecentSearchStore {
//   final Box box = Hive.box('recent_searches');

//   List<String> getRecent() {
//     return List<String>.from(box.get('words', defaultValue: []));
//   }

//   void add(String word) {
//     final List<String> current = getRecent();
//     current.remove(word);
//     current.insert(0, word);

//     if (current.length > 5) {
//       current.removeLast();
//     }
//     box.put('words', current);
//   }
// }

class RecentSearchStore extends ChangeNotifier {
  final Box box = Hive.box('recent_searches');

  List<String> getRecent() {
    return List<String>.from(box.get('words', defaultValue: []));
  }

  void add(String word) {
    final List<String> current = getRecent();

    current.remove(word);
    current.insert(0, word);

    if (current.length > 5) {
      current.removeLast();
    }

    box.put('words', current);

    notifyListeners(); 
  }
}