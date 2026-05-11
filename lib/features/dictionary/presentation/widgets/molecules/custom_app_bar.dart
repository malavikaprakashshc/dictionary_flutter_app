import 'package:dictionary_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final String subTitle;
  final String image;

  const CustomAppBar({
    super.key,
    required this.title,
    required this.subTitle,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontFamily: 'Lora',
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: AppColors.backgroundWhite,
              ),
            ),
            Text(
              subTitle,
              style: TextStyle(
                fontFamily: 'Nunito',
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: AppColors.backgroundWhite,
              ),
            ),
          ],
        ),

        Container(
          height: 60,
          width: 60,
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.backgroundWhite,
          ),
          child: Image.asset(image, height: 20, width: 20, fit: BoxFit.cover),
        ),
      ],
    );
  }
}
