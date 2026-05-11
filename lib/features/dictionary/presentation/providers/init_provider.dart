// ignore_for_file: avoid_print

import 'package:dictionary_app/features/dictionary/data/datasources/local/local_dictionary_datasource.dart';
import 'package:dictionary_app/features/dictionary/data/local/local_dictionary_store.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'init_provider.g.dart';

@riverpod
LocalDictionaryDatasource localDataSource(Ref ref) {
  return LocalDictionaryDatasource();
}

final localStoreProvider = ChangeNotifierProvider<LocalDictionaryStore>((ref) {
  return LocalDictionaryStore();
});

@riverpod
Future<void> appInit(Ref ref) async {
  final dataSource = ref.read(localDataSourceProvider);
  final store = ref.read(localStoreProvider);

  final words = await dataSource.loadDictionary();

  print("Init got words: ${words.length}");

  store.setWords(words);
}
