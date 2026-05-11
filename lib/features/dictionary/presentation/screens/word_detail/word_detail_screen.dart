import 'package:dictionary_app/core/extensions/string_extension.dart';
import 'package:dictionary_app/core/theme/app_colors.dart';
import 'package:dictionary_app/core/theme/app_theme_extension.dart';
import 'package:dictionary_app/features/dictionary/presentation/providers/tts_provider.dart';
import 'package:dictionary_app/features/dictionary/presentation/providers/word_detail_provider.dart';
import 'package:dictionary_app/features/dictionary/presentation/widgets/atoms/capsule_text.dart';
import 'package:dictionary_app/features/dictionary/presentation/widgets/atoms/custom_divider.dart';
import 'package:dictionary_app/features/dictionary/presentation/widgets/atoms/home_sub_heading.dart';
import 'package:dictionary_app/features/dictionary/presentation/widgets/molecules/common_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class WordDetailScreen extends ConsumerStatefulWidget {
  final String word;
  const WordDetailScreen({super.key, required this.word});

  @override
  ConsumerState<WordDetailScreen> createState() => _WordDetailScreenState();

}

class _WordDetailScreenState extends ConsumerState<WordDetailScreen> {
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();

    final tts = ref.read(ttsProvider);

    tts.onComplete = () {
      if (mounted) {
        setState(() {
          isPlaying = false;
        });
      }
    };
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppThemeColors>();
    final wordAsync = ref.watch(wordDetailProvider(widget.word));

    return Scaffold(
      body: wordAsync.when(
        loading: () =>
            Center(child: CircularProgressIndicator(color: colors?.primary)),

        error: (e, _) => Center(child: Text(e.toString())),

        data: (data) {
          final meaning = data.meanings.isNotEmpty ? data.meanings.first : null;

          final definitions = meaning?.definitions ?? [];

          final firstTwoDefinitions = definitions.length > 2
              ? definitions.take(2).toList()
              : definitions;

          final synonyms =
              meaning?.definitions.expand((d) => d.synonyms).toSet().toList() ??
              [];

          return Stack(
            children: [
              Container(color: colors?.primary),

              Container(
                height: 160,
                decoration: BoxDecoration(
                  color: colors?.background,
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(50),
                  ),
                ),
              ),

              Positioned(
                top: 70,
                left: 20,
                right: 20,
                child: CommonNavBar(
                  title: data.word,
                  onBackTap: () {
                    context.pop();
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 160),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// WORD
                      Text(
                        data.word.capitalize(),
                        style: Theme.of(context).textTheme.displayLarge
                            ?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColors.backgroundWhite,
                            ),
                      ),

                      const SizedBox(height: 10),
                      Row(
                        spacing: 20,
                        children: [
                          /// PART OF SPEECH
                          if (meaning != null)
                            CapsuleText(
                              text: meaning.partOfSpeech,
                              textColor: Colors.black87,
                              bgColor: AppColors.backgroundWhite.withAlpha(90),
                            ),

                          /// PHONETIC
                          if (data.phonetic.isNotEmpty)
                            Text(
                              data.phonetic,
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),

                          const SizedBox(height: 10),
                        ],
                      ),

                      CustomDivider(),

                      /// MEANINGS (ONLY 2)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List.generate(firstTwoDefinitions.length, (
                          index,
                        ) {
                          final def = firstTwoDefinitions[index];

                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              /// HEADING PER MEANING
                              HomeSubHeading(
                                text: 'MEANING ${index + 1}',
                                color: AppColors.backgroundWhite,
                              ),

                              /// DEFINITION
                              Text(
                                def.definition,
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),

                              /// EXAMPLE
                              if (def.example.isNotEmpty)
                                Container(
                                  margin: const EdgeInsets.only(top: 6),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 10,
                                    horizontal: 15,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.backgroundWhite.withAlpha(
                                      90,
                                    ),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    '"${def.example}"',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(fontStyle: FontStyle.italic),
                                  ),
                                ),
                              SizedBox(height: 15),
                            ],
                          );
                        }),
                      ),

                      /// SYNONYMS
                      if (synonyms.isNotEmpty) ...[
                        CustomDivider(),

                        HomeSubHeading(
                          text: 'SYNONYMS',
                          color: AppColors.backgroundWhite,
                        ),

                        const SizedBox(height: 10),

                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: synonyms.map((word) {
                            return CapsuleText(
                              text: word,
                              textColor: Colors.black87,
                              bgColor: AppColors.backgroundWhite.withAlpha(90),
                            );
                          }).toList(),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: colors?.primary,
        child: Icon(
          isPlaying ? Icons.pause : Icons.play_arrow,
          color: colors?.background,
        ),
        onPressed: () async {
          final tts = ref.read(ttsProvider);

          if (isPlaying) {
            await tts.stop();
            setState(() => isPlaying = false);
          } else {
            await tts.speak(widget.word);
            setState(() => isPlaying = true);
          }
        },
      ),
    );
  }
}
