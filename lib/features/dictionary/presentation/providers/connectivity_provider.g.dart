// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connectivity_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(connectivityServices)
const connectivityServicesProvider = ConnectivityServicesProvider._();

final class ConnectivityServicesProvider
    extends
        $FunctionalProvider<
          ConnectivityServices,
          ConnectivityServices,
          ConnectivityServices
        >
    with $Provider<ConnectivityServices> {
  const ConnectivityServicesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'connectivityServicesProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$connectivityServicesHash();

  @$internal
  @override
  $ProviderElement<ConnectivityServices> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ConnectivityServices create(Ref ref) {
    return connectivityServices(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ConnectivityServices value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ConnectivityServices>(value),
    );
  }
}

String _$connectivityServicesHash() =>
    r'1b1dc736a43495ad57278ca24aab2fa253fc0585';

@ProviderFor(connectivityStream)
const connectivityStreamProvider = ConnectivityStreamProvider._();

final class ConnectivityStreamProvider
    extends $FunctionalProvider<AsyncValue<bool>, bool, Stream<bool>>
    with $FutureModifier<bool>, $StreamProvider<bool> {
  const ConnectivityStreamProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'connectivityStreamProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$connectivityStreamHash();

  @$internal
  @override
  $StreamProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<bool> create(Ref ref) {
    return connectivityStream(ref);
  }
}

String _$connectivityStreamHash() =>
    r'68f645e88e8eb9dc5eb61a6b633f47f000af8dd9';
