import 'package:flutter/material.dart';

import '../../../../utils/app_text_styles.dart';

class CustomTap extends StatelessWidget {
  CustomTap({super.key, required this.image, required this.text});

  String image;
  String text;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Image.asset(image),
        SizedBox(height: height * 0.02),
        Text(text, style: AppTextStyles.regular20White),
      ],
    );
  }
}
