import 'package:dictionary_app/features/dictionary/data/models/word_model.dart';
import 'package:dio/dio.dart';

class DictionaryApiDatasource {
  final Dio dio;

  DictionaryApiDatasource(this.dio);

  Future<WordModel> fetchWord(String word) async {
  final response = await dio.get(
    'https://api.dictionaryapi.dev/api/v2/entries/en/$word',
  );

  final jsonResponse = response.data;

  if (jsonResponse is List && jsonResponse.isNotEmpty) {
    final models =
        jsonResponse.map<WordModel>((e) => WordModel.fromJson(e)).toList();

    // ✅ Pick first VALID model (with meanings)
    final valid = models.firstWhere(
      (m) => m.meanings != null && m.meanings!.isNotEmpty,
      orElse: () => models.first,
    );

    return valid;
  }

  throw Exception("No data found");
}
}
