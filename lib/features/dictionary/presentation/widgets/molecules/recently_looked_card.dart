import 'package:dictionary_app/core/theme/app_colors.dart';
import 'package:dictionary_app/core/theme/app_theme_extension.dart';
import 'package:flutter/material.dart';

class RecentlyLookedCard extends StatelessWidget {
  final String word;
  final VoidCallback onTapNavigate;

  const RecentlyLookedCard({super.key, required this.word, required this.onTapNavigate});

  @override
  Widget build(BuildContext context) {
     final colors = Theme.of(context).extension<AppThemeColors>();

    return Container(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.primaryBlue, width: 2),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                word,
                style: TextStyle(
                  fontFamily: 'Lora',
                  fontSize: 24,
                  color: colors?.text,
                  fontWeight: FontWeight.bold,
                  height: 1.2,
                ),
              ),
              // Text(
              //   'noun',
              //   style: TextStyle(
              //     fontSize: 16,
              //     color: AppColors.primaryBlue,
              //     fontStyle: .italic,
              //   ),
              // ),
            ],
          ),
          IconButton(
            onPressed: onTapNavigate,
            icon: Container(
              padding: EdgeInsets.all(3),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primaryBlue.withAlpha(160),
              ),
              child: Icon(
                Icons.chevron_right,
                size: 25,
                color: AppColors.backgroundWhite,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
