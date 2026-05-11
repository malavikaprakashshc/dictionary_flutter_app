import 'package:dictionary_app/features/dictionary/domain/entities/word.dart';
import 'package:dictionary_app/features/dictionary/presentation/providers/init_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_provider.g.dart';

@riverpod
class SearchNotifier extends _$SearchNotifier {

  @override
    List<Word> build() {
    return [];
  }

  void search(String query) {
    final store = ref.read(localStoreProvider);

    if (query.isEmpty) {
      state = [];
      return;
    }

    final q = query.toLowerCase();
    
    final results = store.words
        .where((word) => 
          word.word.toLowerCase().startsWith(q))
        .take(6)
        .toList();

    state = results;
  }
}
