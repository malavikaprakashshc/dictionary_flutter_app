import 'dart:math';
import 'package:dictionary_app/features/dictionary/domain/entities/word.dart';
import 'package:dictionary_app/features/dictionary/presentation/providers/init_provider.dart';
import 'package:dictionary_app/features/dictionary/presentation/providers/repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'word_of_the_day_provider.g.dart';

@Riverpod(keepAlive: true)
Future<Word?> wordOfTheDay(Ref ref) async {
  final store = ref.watch(localStoreProvider);

  if (store.words.isEmpty) return null;

  final validWords =
      store.words.where((w) => w.meanings.isNotEmpty).toList();

  if (validWords.isEmpty) return null;

  final random = Random();
  final randomWord = validWords[random.nextInt(validWords.length)];

  try {
    final repo = ref.read(dictionaryRepositoryProvider);
    final apiWord = await repo.getWord(randomWord.word);
    return apiWord;
  } catch (e) {
    return randomWord;
  }
}

