// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'init_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(localDataSource)
const localDataSourceProvider = LocalDataSourceProvider._();

final class LocalDataSourceProvider
    extends
        $FunctionalProvider<
          LocalDictionaryDatasource,
          LocalDictionaryDatasource,
          LocalDictionaryDatasource
        >
    with $Provider<LocalDictionaryDatasource> {
  const LocalDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'localDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$localDataSourceHash();

  @$internal
  @override
  $ProviderElement<LocalDictionaryDatasource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  LocalDictionaryDatasource create(Ref ref) {
    return localDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LocalDictionaryDatasource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LocalDictionaryDatasource>(value),
    );
  }
}

String _$localDataSourceHash() => r'ee4e800603c531d7102be2ee597b9b5f9fedc26f';

@ProviderFor(appInit)
const appInitProvider = AppInitProvider._();

final class AppInitProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  const AppInitProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appInitProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appInitHash();

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    return appInit(ref);
  }
}

String _$appInitHash() => r'b47105e1fe12eca7ec2ea78ca5f771822014159a';
