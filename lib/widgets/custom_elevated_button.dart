import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color borderColor;
  final Color backgroundColor;
  final TextStyle? textStyle;
  final bool hasPrefixIcon;
  final bool hasSuffixIcon;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final double? verticalPadding;
  final double? horizontalPadding;

  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.borderColor = AppColors.yellow,
    this.backgroundColor = AppColors.yellow,
    this.textStyle,
    this.hasPrefixIcon = false,
    this.hasSuffixIcon = false,
    this.prefixIcon,
    this.suffixIcon,
    this.verticalPadding,
    this.horizontalPadding,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(color: borderColor, width: 2),
        ),
        elevation: 0,
        padding: EdgeInsets.symmetric(
          vertical: verticalPadding ?? height * 0.01,
          horizontal: horizontalPadding ?? width * 0.3,
        ),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          (hasPrefixIcon && prefixIcon != null)
              ? Row(
                  children: [
                    prefixIcon!,
                    SizedBox(width: width * 0.02),
                  ],
                )
              : const SizedBox.shrink(),
          Text(text, style: textStyle ?? AppTextStyles.semibold20Black),
          (hasSuffixIcon && suffixIcon != null)
              ? Row(
                  children: [
                    SizedBox(width: width * 0.02),
                    suffixIcon!,
                  ],
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
