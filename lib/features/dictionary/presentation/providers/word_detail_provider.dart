import 'package:dictionary_app/features/dictionary/domain/entities/word.dart';
import 'package:dictionary_app/features/dictionary/presentation/providers/repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'word_detail_provider.g.dart';

@riverpod
Future<Word> wordDetail(Ref ref, String query) async {
  final repo = ref.read(dictionaryRepositoryProvider);
  return repo.getWord(query);
}
