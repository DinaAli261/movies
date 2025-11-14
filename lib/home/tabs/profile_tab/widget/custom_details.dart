import 'package:flutter/material.dart';

import '../../../../utils/app_text_styles.dart';

class CustomDetails extends StatelessWidget {
  CustomDetails({super.key, required this.text, required this.num});

  String num;
  String text;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Text(num, style: AppTextStyles.bold36White),
        SizedBox(height: height * 0.02),
        Text(text, style: AppTextStyles.bold24White),
      ],
    );
  }
}
