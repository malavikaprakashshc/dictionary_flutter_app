import 'package:dictionary_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'app_theme_extension.dart';

class AppTheme {
  static ThemeData light() {
    return ThemeData(
      brightness: Brightness.light,
      fontFamily: 'Nunito',
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontFamily: 'Lora',
          fontWeight: FontWeight.bold,
        ),
        headlineMedium: TextStyle(
          fontFamily: 'Lora',
          fontWeight: FontWeight.w600,
          fontSize: 40,
        ),
        bodyMedium: TextStyle(fontFamily: 'Nunito'),
        bodySmall: TextStyle(fontFamily: 'Nunito'),
        bodyLarge: TextStyle(fontFamily: 'Nunito', fontSize: 15),
      ),
      extensions: <ThemeExtension<dynamic>>[
        AppThemeColors(
          primary: AppColors.primaryBlue,
          background: AppColors.backgroundWhite, 
          text: Colors.black.withAlpha(180),
        ),
      ],
    );
  }

  static ThemeData dark() {
    return ThemeData(
      brightness: Brightness.dark,
      fontFamily: 'Nunito',
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontFamily: 'Lora',
          fontWeight: FontWeight.bold,
        ),
        headlineMedium: TextStyle(
          fontFamily: 'Lora',
          fontWeight: FontWeight.w600,
          fontSize: 40,
        ),
        bodyMedium: TextStyle(fontFamily: 'Nunito'),
        bodySmall: TextStyle(fontFamily: 'Nunito'),
        bodyLarge: TextStyle(fontFamily: 'Nunito', fontSize: 15),
      ),
      extensions: const <ThemeExtension<dynamic>>[
        AppThemeColors(
          primary: Color.fromARGB(255, 133, 150, 158),
          background: AppColors.backgroundDark, 
          text: AppColors.textLight,
        ),
      ],
    );
  }
}
