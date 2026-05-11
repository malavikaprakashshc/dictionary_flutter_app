// ignore_for_file: avoid_print

import 'dart:async';
import 'package:dictionary_app/config/router/app_router.dart';
import 'package:dictionary_app/core/extensions/word_extension.dart';
import 'package:dictionary_app/core/theme/app_colors.dart';
import 'package:dictionary_app/core/theme/app_theme_extension.dart';
import 'package:dictionary_app/features/dictionary/presentation/providers/connectivity_provider.dart';
import 'package:dictionary_app/features/dictionary/presentation/providers/recent_search_provider.dart';
import 'package:dictionary_app/features/dictionary/presentation/providers/repository_provider.dart';
import 'package:dictionary_app/features/dictionary/presentation/providers/word_of_the_day_provider.dart';
import 'package:dictionary_app/features/dictionary/presentation/widgets/atoms/home_sub_heading.dart';
import 'package:dictionary_app/features/dictionary/presentation/widgets/molecules/custom_app_bar.dart';
import 'package:dictionary_app/features/dictionary/presentation/widgets/molecules/custom_search_bar.dart';
import 'package:dictionary_app/features/dictionary/presentation/widgets/molecules/recently_looked_card.dart';
import 'package:dictionary_app/features/dictionary/presentation/widgets/molecules/word_of_the_day_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dictionary_app/features/dictionary/presentation/providers/search_provider.dart';
import 'package:dictionary_app/features/dictionary/domain/entities/word.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final searchController = TextEditingController();
  final ScrollController _dropdownController = ScrollController();
  final GlobalKey _searchBarKey = GlobalKey();

  Timer? _debounce;
  bool _noWordFound = false;
  bool _wasOnline = true;

  @override
  void dispose() {
    _debounce?.cancel();
    searchController.dispose();
    _dropdownController.dispose();
    super.dispose();
  }

  //seach bar text change
  void onSearchChanged(String query) {
    _debounce?.cancel();

    setState(() {
      _noWordFound = false;
    });

    _debounce = Timer(const Duration(milliseconds: 300), () {
      ref.read(searchProvider.notifier).search(query);
    });
  }

  //search bar submitted or clicked on word in bottomsheet
  Future<void> _handleSearch(String query) async {
    if (query.trim().isEmpty) return;
    try {
      final repo = ref.read(dictionaryRepositoryProvider);
      final word = await repo.getWord(query);

      ref.read(searchProvider.notifier).search('');
      ref.read(recentSearchStoreProvider).add(word.word);

      setState(() {
        searchController.clear();
        _noWordFound = false;
      });

      if (!mounted) return;
      context.push('/wordDetail', extra: word.word);
    } catch (e) {
      setState(() {
        _noWordFound = true; // ❌ show "No word found"
      });
    }
  }

    //To find the bottom of search bar to place dropdown correctly
  double _getSearchBarBottom() {
    final renderBox =
        _searchBarKey.currentContext?.findRenderObject() as RenderBox?;

    if (renderBox == null) return 200; // fallback

    final position = renderBox.localToGlobal(Offset.zero);
    return position.dy + renderBox.size.height;
  }


  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppThemeColors>();

    final List<Word> results = ref.watch(searchProvider);
    final wordOfDayAsync = ref.watch(wordOfTheDayProvider);
    final recent = ref.watch(recentSearchesProvider);
    final isOnline = ref.watch(connectivityStreamProvider);

    ref.listen(connectivityStreamProvider, (previous, next) {
      next.whenData((isOnline) {
        if (isOnline != _wasOnline) {
          _wasOnline = isOnline;
          final messenger = ScaffoldMessenger.of(context);
          messenger.hideCurrentSnackBar();
          messenger.showSnackBar(
            SnackBar(
              content: Text(
                isOnline ? "You are online 🟢" : "You are offline ❌",
                style: TextStyle(color: Colors.black),
              ),
              backgroundColor: const Color.fromARGB(232, 181, 202, 212),
              behavior: SnackBarBehavior.floating,
              duration: isOnline
                  ? const Duration(seconds: 2)
                  : const Duration(days: 1),
            ),
          );
        }
      });
    });

    return Scaffold(
      body: Stack(
        children: [
          Container(color: colors?.background),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              width: double.infinity,
              height: 250,
              decoration: BoxDecoration(
                color: colors?.primary,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(50),
                ),
              ),
              child: SafeArea(
                bottom: false,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomAppBar(
                        title: 'WordNook',
                        subTitle: 'your cozy corner of words',
                        image: 'assets/images/appLogo.png',
                      ),

                      SizedBox(height: 20),

                      CustomSearchBar(
                        key: _searchBarKey,
                        controller: searchController,
                        onChanged: (String value) {
                          onSearchChanged(value);
                        },
                        onSubmitted: (String value) {
                          _handleSearch(value);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          Positioned(
            top: 250,
            left: 0,
            right: 0,
            bottom: 0,
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              children: [
                HomeSubHeading(text: 'NEW WORD FOR YOU!'),
                SizedBox(height: 10),

                wordOfDayAsync.when(
                  data: (wordOfDay) {
                    if (wordOfDay == null) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      return WordOfTheDayCard(
                        word: wordOfDay.word,
                        wordMeaning:
                            wordOfDay.firstDefinition?.isNotEmpty == true
                            ? wordOfDay.firstDefinition ?? ""
                            : "No definition available",
                        partOfSpeech: wordOfDay.firstPartOfSpeech ?? '',
                      );
                    }
                  },
                  loading: () =>
                       Center(child: CircularProgressIndicator(color: colors?.primary,)),
                  error: (error, stack) =>
                      const Text('Failed to load word of the day'),
                ),

                SizedBox(height: 20),

                if (recent.isNotEmpty) ...[
                  HomeSubHeading(text: 'RECENTLY LOOKED UP'),
                  SizedBox(height: 10),
                  Column(
                    children: recent.map((word) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: RecentlyLookedCard(
                          word: word,
                          onTapNavigate: () {
                            router.push('/wordDetail', extra: word);
                          },
                        ),
                      );
                    }).toList(),
                  ),
                ],
                if (!_wasOnline) const SizedBox(height: 75),
              ],
            ),
          ),

          ValueListenableBuilder(
            valueListenable: searchController,
            builder: (context, _, _) {
              if (searchController.text.trim().isEmpty) {
                return const SizedBox();
              }
              return Positioned(
                top: _getSearchBarBottom() + 5,
                left: 20,
                right: 20,
                child: _buildSearchResults(results, isOnline),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSearchResults(
    List<Word> results,
    AsyncValue<bool> isOnlineAsync,
  ) {
    final colors = Theme.of(context).extension<AppThemeColors>();
    //ONLINE
    if (results.isEmpty) {
      return isOnlineAsync.when(
        data: (isOnline) {
          return Container(
            decoration: BoxDecoration(
              color: colors?.background,
              border: Border.all(color: colors!.primary, width: 2),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8)],
            ),
            child: _noWordFound
                ? ListTile(
                    leading: const Icon(Icons.error_outline),
                    title: Text(
                      isOnline
                          ? "No word found"
                          : "Word is not available offline",
                    ),
                  )
                : isOnline
                ? ListTile(
                    leading: const Icon(Icons.search),
                    title: Text('Search "${searchController.text}" online'),
                    onTap: () {
                      final query = searchController.text.trim();
                      _handleSearch(query);
                    },
                  )
                : const ListTile(
                    leading: Icon(Icons.wifi_off),
                    title: Text("You're offline"),
                  ),
          );
        },
        loading: () => const SizedBox(),
        error: (_, _) => const SizedBox(),
      );
    }

    //OFFLINE
    return Container(
      decoration: BoxDecoration(
        color: colors?.background,
        border: Border.all(color: colors!.primary, width: 2),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8)],
      ),
      constraints: const BoxConstraints(maxHeight: 220),
      child: Scrollbar(
        controller: _dropdownController,
        thumbVisibility: true,
        thickness: 4, //scroll indicator
        child: ListView.separated(
          controller: _dropdownController,
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          itemCount: results.length,
          separatorBuilder: (context, index) {
            return Divider(
              height: 1,
              thickness: 2,
              color: AppColors.primaryBlue,
              indent: 0,
              endIndent: 0,
            );
          },
          itemBuilder: (context, index) {
            final word = results[index];
            final matchLength = searchController.text.length <= word.word.length
                ? searchController.text.length
                : word.word.length;

            return ListTile(
              title: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: word.word.substring(0, matchLength),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: word.word.substring(matchLength)),
                  ],
                ),
              ),
              onTap: () {
                ref.read(searchProvider.notifier).search('');

                ref.read(recentSearchStoreProvider).add(word.word);
                ref.invalidate(recentSearchesProvider);

                searchController.clear();

                context.push('/wordDetail', extra: word.word);
              },
            );
          },
        ),
      ),
    );
  }
}
