import 'package:flutter/material.dart';

@immutable
class AppThemeColors extends ThemeExtension<AppThemeColors> {
  final Color primary;
  final Color background;
  final Color text;

  const AppThemeColors({
    required this.primary,
    required this.background,
    required this.text,
  });

  @override
  AppThemeColors copyWith({Color? primary, Color? background, Color? text}) {
    return AppThemeColors(
      primary: primary ?? this.primary,
      background: background ?? this.background,
      text: text ?? this.background,
    );
  }

  @override
  AppThemeColors lerp(ThemeExtension<AppThemeColors>? other, double t) {
    if (other is! AppThemeColors) return this;

    return AppThemeColors(
      primary: Color.lerp(primary, other.primary, t)!,
      background: Color.lerp(background, other.background, t)!,
      text: Color.lerp(background, other.background, t)!,
    );
  }
}
