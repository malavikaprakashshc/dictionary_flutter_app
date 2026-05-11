// ignore_for_file: avoid_print

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dictionary_app/features/dictionary/data/datasources/local/word_cache.dart';
import 'package:dictionary_app/features/dictionary/data/datasources/remote/dictionary_api_datasource.dart';
import 'package:dictionary_app/features/dictionary/data/local/local_dictionary_store.dart';
import 'package:dictionary_app/features/dictionary/domain/entities/word.dart';
import 'package:dictionary_app/features/dictionary/domain/repositories/dictionary_repository.dart';

class DictionaryRepositoryImpl implements DictionaryRepository {
  final DictionaryApiDatasource api;
  final WordCache cache;
  final LocalDictionaryStore localStore;

  DictionaryRepositoryImpl(this.api, this.cache, this.localStore);

  @override
  @override
Future<Word> getWord(String query) async {
  final connectivity = await Connectivity().checkConnectivity();
  final isOnline = connectivity != ConnectivityResult.none;

  // 1. TRY API FIRST
  if (isOnline) {
    try {
      final model = await api.fetchWord(query);
      final word = model.toEntity();

      cache.save(word);
      localStore.addWord(word);

      return word;
    } catch (e) {
      print("API failed, fallback to cache/local");
    }
  }

  // 2. CACHE
  final cached = cache.get(query);
  if (cached != null) {
    print("Loaded from cache");
    return cached;
  }

  // 3. LOCAL STORE
  final local = localStore.words.firstWhere(
    (w) => w.word.toLowerCase() == query.toLowerCase(),
    orElse: () => Word(word: '', phonetic: '', meanings: []),
  );

  if (local.word.isNotEmpty) {
    print("Loaded from local JSON");
    return local;
  }

  // 4. NOTHING FOUND
  throw Exception("No data available");
}
}
