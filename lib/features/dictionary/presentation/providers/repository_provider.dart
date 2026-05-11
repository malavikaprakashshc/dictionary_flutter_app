
import 'package:dictionary_app/features/dictionary/data/datasources/local/word_cache.dart';
import 'package:dictionary_app/features/dictionary/data/datasources/remote/dictionary_api_datasource.dart';
import 'package:dictionary_app/features/dictionary/data/repositories/dictionary_repository_impl.dart';
import 'package:dictionary_app/features/dictionary/domain/repositories/dictionary_repository.dart';
import 'package:dictionary_app/features/dictionary/presentation/providers/init_provider.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repository_provider.g.dart';

@riverpod
DictionaryApiDatasource dictionaryApiDatasource(Ref ref) {
  return DictionaryApiDatasource(Dio());
}

@riverpod
WordCache wordCache(Ref ref) {
  return WordCache();
}

@riverpod
DictionaryRepository dictionaryRepository(Ref ref) {
  return DictionaryRepositoryImpl(
    ref.read(dictionaryApiDatasourceProvider),
    ref.read(wordCacheProvider),
    ref.read(localStoreProvider)
  );
}