import 'package:flutter/material.dart';
import 'package:movies/utils/app_colors.dart';
import 'package:movies/utils/app_text_styles.dart';

typedef OnValidator=String? Function(String?)?;

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    super.key,
    required this.controller,
    this.hintStyle,
    required this.hintText,
    required this.prefixIcon,
    this.suffixIcon,
    this.boarderSideColor=AppColors.transparent,
    this.validator,
    this.obscureText=false,
  });
  TextEditingController controller;
  TextStyle? hintStyle;
  String hintText;
  Widget prefixIcon;
  Widget? suffixIcon;
  Color boarderSideColor;
  OnValidator validator;
  bool obscureText;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery
        .of(context)
        .size
        .height;
    return Padding(
      padding: EdgeInsets.only(bottom: 0.025 * height),
      child: TextFormField(
        cursorColor: AppColors.yellow,
        style: hintStyle,
        validator: validator,
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.grey,
          hintStyle: hintStyle ?? AppTextStyles.regular16White,
          hintText: hintText,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          focusedBorder: customOutlineInputBoarder(
              boarderColorSide: boarderSideColor),
          focusedErrorBorder: customOutlineInputBoarder(
              boarderColorSide: AppColors.red),
          enabledBorder: customOutlineInputBoarder(
              boarderColorSide: boarderSideColor),
          errorBorder: customOutlineInputBoarder(
              boarderColorSide: AppColors.red),

        ),


      ),
    );
  }

  OutlineInputBorder customOutlineInputBoarder(
      {required Color boarderColorSide}) {

    return OutlineInputBorder(
        borderRadius:BorderRadius.circular(15),
        borderSide: BorderSide(
          width: 2,
          color: boarderColorSide,
        )
    );
  }
}