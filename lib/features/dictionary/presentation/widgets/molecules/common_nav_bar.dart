import 'package:dictionary_app/core/extensions/string_extension.dart';
import 'package:dictionary_app/core/theme/app_theme_extension.dart';
import 'package:flutter/material.dart';

class CommonNavBar extends StatelessWidget {
  final String title;
  final VoidCallback onBackTap;

  const CommonNavBar({super.key, required this.title, required this.onBackTap});

  @override
  Widget build(BuildContext context) {
       final colors = Theme.of(context).extension<AppThemeColors>();
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(top: 5),
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: colors!.text),
          ),
          child: IconButton(
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            onPressed: onBackTap,
            icon: Icon(
              Icons.chevron_left,
              size: 30,
              color: colors.text,
            ),
          ),
        ),
        SizedBox(width: 20),
        Text(
          title.capitalize(),
          style: TextStyle(
            fontFamily: 'Lora',
            fontSize: 40,
            color: colors.text,
            fontWeight: FontWeight.bold,
            height: 1,
          ),
        ),
      ],
    );
  }
}
