// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SearchNotifier)
const searchProvider = SearchNotifierProvider._();

final class SearchNotifierProvider
    extends $NotifierProvider<SearchNotifier, List<Word>> {
  const SearchNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'searchProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$searchNotifierHash();

  @$internal
  @override
  SearchNotifier create() => SearchNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Word> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Word>>(value),
    );
  }
}

String _$searchNotifierHash() => r'08e1651c5bb399b9e1b52f1c9bcaa77eba21844c';

abstract class _$SearchNotifier extends $Notifier<List<Word>> {
  List<Word> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<List<Word>, List<Word>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<Word>, List<Word>>,
              List<Word>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
