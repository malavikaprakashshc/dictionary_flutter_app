import 'package:dictionary_app/features/dictionary/data/local/recent_search_store.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recent_search_provider.g.dart';

final recentSearchStoreProvider =
    ChangeNotifierProvider<RecentSearchStore>((ref) {
  return RecentSearchStore();
});

@riverpod
List<String> recentSearches(Ref ref) {
  final store = ref.watch(recentSearchStoreProvider);
  return store.getRecent();
}