import 'package:flutter/material.dart';

import '../utils/app_text_styles.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final TextStyle textStyle;

  CustomTextButton({
    required this.text,
    required this.onPressed,
    TextStyle? textStyle,
    super.key,
  }) : textStyle = textStyle ?? AppTextStyles.black14Yellow;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        splashFactory: NoSplash.splashFactory,
        shadowColor: Colors.transparent,
        overlayColor: Colors.transparent,
      ),

      child: Text(text, style: textStyle),
    );
  }
}