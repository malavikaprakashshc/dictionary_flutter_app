// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word_of_the_day_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(wordOfTheDay)
const wordOfTheDayProvider = WordOfTheDayProvider._();

final class WordOfTheDayProvider
    extends $FunctionalProvider<AsyncValue<Word?>, Word?, FutureOr<Word?>>
    with $FutureModifier<Word?>, $FutureProvider<Word?> {
  const WordOfTheDayProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'wordOfTheDayProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$wordOfTheDayHash();

  @$internal
  @override
  $FutureProviderElement<Word?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Word?> create(Ref ref) {
    return wordOfTheDay(ref);
  }
}

String _$wordOfTheDayHash() => r'1a9f26be301b59b5cf92f7afef33c91f55dfb86e';
