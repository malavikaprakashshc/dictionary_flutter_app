import 'package:dictionary_app/features/dictionary/domain/entities/word.dart';

abstract class DictionaryRepository {
  Future<Word> getWord(String query);
}