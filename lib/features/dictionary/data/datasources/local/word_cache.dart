import 'package:dictionary_app/features/dictionary/domain/entities/word.dart';

class WordCache {
  final Map<String, Word> _cache = {};

  void save(Word word) {
    _cache[word.word.toLowerCase()] = word;
  }

  Word? get(String word) {
    return _cache[word.toLowerCase()];
  }
}
