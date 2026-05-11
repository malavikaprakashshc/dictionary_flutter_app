import 'dart:convert';
import 'package:dictionary_app/features/dictionary/data/models/word_model.dart';
import 'package:dictionary_app/features/dictionary/domain/entities/word.dart';
import 'package:flutter/services.dart';

class LocalDictionaryDatasource {
  Future<List<Word>> loadDictionary() async {
    final jsonString = await rootBundle.loadString(
      'assets/data/dictionary.json',
    );

    final List<dynamic> data = json.decode(jsonString);
    
    final words = data.map((e) {
      return WordModel.fromJson(e as Map<String, dynamic>).toEntity();
    }).toList();

    return words;
  }
}
