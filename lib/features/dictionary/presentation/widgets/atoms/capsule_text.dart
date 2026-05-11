import 'package:dictionary_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CapsuleText extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color bgColor;
  final Color borderColor;

  const CapsuleText({super.key, required this.text, this.textColor = AppColors.backgroundWhite, this.bgColor = AppColors.primaryBlue, this.borderColor = AppColors.backgroundWhite});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      decoration: BoxDecoration(
        color: bgColor,
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: textColor),
      ),
    );
  }
}
