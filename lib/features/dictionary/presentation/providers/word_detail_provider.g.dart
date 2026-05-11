// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word_detail_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(wordDetail)
const wordDetailProvider = WordDetailFamily._();

final class WordDetailProvider
    extends $FunctionalProvider<AsyncValue<Word>, Word, FutureOr<Word>>
    with $FutureModifier<Word>, $FutureProvider<Word> {
  const WordDetailProvider._({
    required WordDetailFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'wordDetailProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$wordDetailHash();

  @override
  String toString() {
    return r'wordDetailProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<Word> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Word> create(Ref ref) {
    final argument = this.argument as String;
    return wordDetail(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is WordDetailProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$wordDetailHash() => r'6ee8198f40e46ba5da8019175347a9f507eeb313';

final class WordDetailFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Word>, String> {
  const WordDetailFamily._()
    : super(
        retry: null,
        name: r'wordDetailProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  WordDetailProvider call(String query) =>
      WordDetailProvider._(argument: query, from: this);

  @override
  String toString() => r'wordDetailProvider';
}
