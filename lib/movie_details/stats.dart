import 'package:flutter/material.dart';
import 'package:movies/utils/app_text_styles.dart';

import '../utils/app_colors.dart';

class Stats extends StatelessWidget {
  final Widget icon;
  final String text;

  const Stats({required this.icon, required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.025,
        vertical: size.height * 0.012,
      ),
      width: size.width *0.28,
      decoration: BoxDecoration(
        color: AppColors.grey,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        spacing: 18,
        children: [
          icon,
          Text(text, style: AppTextStyles.bold24White),
        ],
      ),
    );
  }
}