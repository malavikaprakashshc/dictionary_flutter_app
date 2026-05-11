import 'package:dictionary_app/core/theme/app_colors.dart';
import 'package:dictionary_app/core/theme/app_theme_extension.dart';
import 'package:flutter/material.dart';

class WordOfTheDayCard extends StatelessWidget {
  final String word;
  final String wordMeaning;
  final String partOfSpeech;

  const WordOfTheDayCard({
    super.key,
    required this.word,
    required this.wordMeaning, required this.partOfSpeech,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppThemeColors>();

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
      decoration: BoxDecoration(
        color: colors?.primary,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.backgroundWhite),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              'Today\'s Pick',
              style: TextStyle(
                fontSize: 15,
                color: AppColors.backgroundWhite,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Text(
            word,
            style: TextStyle(
              fontFamily: 'Lora',
              fontSize: 33,
              color: AppColors.backgroundWhite,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            partOfSpeech,
            style: TextStyle(
              fontSize: 15,
              color: AppColors.backgroundWhite,
              fontStyle: .italic,
            ),
          ),
          SizedBox(height: 10),
          Text(
            wordMeaning,
            style: TextStyle(
              fontSize: 15,
              color: AppColors.backgroundWhite,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
