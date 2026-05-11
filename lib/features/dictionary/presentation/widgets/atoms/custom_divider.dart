import 'package:dictionary_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      height: 1,
      decoration: BoxDecoration(color: AppColors.backgroundWhite),
    );
  }
}
