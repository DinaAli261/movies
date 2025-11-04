import 'package:flutter/material.dart';
import 'package:movies/utils/app_colors.dart';
import 'package:movies/utils/app_text_styles.dart';

typedef onValidator=String? Function(String?)?;

class CustomeTextFormField extends StatelessWidget {
  CustomeTextFormField({
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
  onValidator validator;
  bool?obscureText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      obscureText:obscureText! ,
      decoration: InputDecoration(
        hintStyle: hintStyle ??AppTextStyles.regular16White,
        hintText: hintText,
        prefixIcon:prefixIcon ,
        suffixIcon: suffixIcon,
        focusedBorder:customeOutlineInputBoarder(boarderColorSide: boarderSideColor) ,
        focusedErrorBorder:customeOutlineInputBoarder(boarderColorSide: AppColors.red) ,
        enabledBorder:customeOutlineInputBoarder(boarderColorSide: boarderSideColor) ,
        errorBorder: customeOutlineInputBoarder(boarderColorSide: AppColors.red) ,

      ),



    );
  }
  OutlineInputBorder customeOutlineInputBoarder({required Color boarderColorSide}){

    return OutlineInputBorder(
        borderRadius:BorderRadius.circular(15),
        borderSide: BorderSide(
          width: 2,
          color: boarderColorSide,

        )
    );
  }
}