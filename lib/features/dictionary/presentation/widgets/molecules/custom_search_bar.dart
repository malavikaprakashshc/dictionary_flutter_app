import 'package:dictionary_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final ValueChanged<String> onSubmitted;
  final TextEditingController controller;

  const CustomSearchBar({
    super.key,
    required this.onChanged,
    required this.onSubmitted,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.backgroundWhite),
      ),
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 10,
        children: [
          Icon(Icons.search, size: 32, color: AppColors.backgroundWhite),
          Expanded(
            child: TextField(
              controller: controller,
              onChanged: onChanged,
              onSubmitted: onSubmitted,
              style: TextStyle(
                color: AppColors.backgroundWhite,
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
              decoration: InputDecoration(
                hintText: "Search a word...",
                hintStyle: TextStyle(
                  color: AppColors.backgroundWhite,
                  fontSize: 17,
                  fontWeight: FontWeight.w100,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              controller.clear();
            },
            icon: Container(
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.backgroundWhite,
              ),
              child: Icon(Icons.close, size: 15, color: AppColors.primaryBlue),
            ),
          ),
        ],
      ),
    );
  }
}
