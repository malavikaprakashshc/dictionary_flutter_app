import 'package:dictionary_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class HomeSubHeading extends StatelessWidget {
  final String text;
  final Color color;

  const HomeSubHeading({
    super.key,
    required this.text,
    this.color = AppColors.primaryBlue,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: color, fontSize: 16, fontWeight: FontWeight.w900),
    );
  }
}
