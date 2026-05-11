// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repository_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(dictionaryApiDatasource)
const dictionaryApiDatasourceProvider = DictionaryApiDatasourceProvider._();

final class DictionaryApiDatasourceProvider
    extends
        $FunctionalProvider<
          DictionaryApiDatasource,
          DictionaryApiDatasource,
          DictionaryApiDatasource
        >
    with $Provider<DictionaryApiDatasource> {
  const DictionaryApiDatasourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dictionaryApiDatasourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dictionaryApiDatasourceHash();

  @$internal
  @override
  $ProviderElement<DictionaryApiDatasource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  DictionaryApiDatasource create(Ref ref) {
    return dictionaryApiDatasource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DictionaryApiDatasource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DictionaryApiDatasource>(value),
    );
  }
}

String _$dictionaryApiDatasourceHash() =>
    r'2e411a3d396a24a11b91708d8c1f378ebcb03615';

@ProviderFor(wordCache)
const wordCacheProvider = WordCacheProvider._();

final class WordCacheProvider
    extends $FunctionalProvider<WordCache, WordCache, WordCache>
    with $Provider<WordCache> {
  const WordCacheProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'wordCacheProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$wordCacheHash();

  @$internal
  @override
  $ProviderElement<WordCache> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  WordCache create(Ref ref) {
    return wordCache(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(WordCache value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WordCache>(value),
    );
  }
}

String _$wordCacheHash() => r'35de82c511616e28f2677feb6ef888abb56499ba';

@ProviderFor(dictionaryRepository)
const dictionaryRepositoryProvider = DictionaryRepositoryProvider._();

final class DictionaryRepositoryProvider
    extends
        $FunctionalProvider<
          DictionaryRepository,
          DictionaryRepository,
          DictionaryRepository
        >
    with $Provider<DictionaryRepository> {
  const DictionaryRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dictionaryRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dictionaryRepositoryHash();

  @$internal
  @override
  $ProviderElement<DictionaryRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  DictionaryRepository create(Ref ref) {
    return dictionaryRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DictionaryRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DictionaryRepository>(value),
    );
  }
}

String _$dictionaryRepositoryHash() =>
    r'a35c0c421578516d44ca396d008383ce5b091401';
