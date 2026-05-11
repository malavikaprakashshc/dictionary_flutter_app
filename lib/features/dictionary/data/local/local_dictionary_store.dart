// ignore_for_file: avoid_print

import 'package:dictionary_app/features/dictionary/domain/entities/word.dart';
import 'package:flutter/material.dart';

class LocalDictionaryStore extends ChangeNotifier {
  List<Word> words = [];

  void setWords(List<Word> newWords) {
    words = newWords;
    print("Store initialized: ${words.length}");
    notifyListeners(); // 🔥 IMPORTANT
  }

  void addWord(Word word) {
    final exists = words.any(
      (w) => w.word.toLowerCase() == word.word.toLowerCase(),
    );

    if (!exists) {
      words.add(word);
      print("Word added: ${word.word}");
      notifyListeners(); // 🔥 IMPORTANT
    }
  }
}