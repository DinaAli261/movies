import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_images.dart';
import '../bloc/language_bloc.dart';
import '../bloc/language_event.dart';

class ChooseLanguage extends StatefulWidget {
  bool isLang;

  ChooseLanguage({super.key, required this.isLang});

  @override
  State<ChooseLanguage> createState() => _ChooseLanguageState();
}

class _ChooseLanguageState extends State<ChooseLanguage> {
  bool isSelectedAr = true;
  bool isSelectedEN = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(1),
      decoration: BoxDecoration(
        color: AppColors.transparent,
        border: Border.all(width: 2, color: AppColors.yellow),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                isSelectedAr = true;
                isSelectedEN = false;
                BlocProvider.of<LanguageBloc>(context).add(
                    ChangeLanguage("ar"));
              });
            },
            child: Container(
              decoration: BoxDecoration(
                border: isSelectedAr
                    ? Border.all(width: 3, color: AppColors.yellow)
                    : null,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Image.asset(AppImages.eg, height: 25, width: 25),
            ),
          ),
          SizedBox(width: 20),
          InkWell(
            onTap: () {
              setState(() {
                isSelectedAr = false;
                isSelectedEN = true;
                BlocProvider.of<LanguageBloc>(context).add(
                    ChangeLanguage("en"));
              });
            },
            child: Container(
              decoration: BoxDecoration(
                border: isSelectedEN
                    ? Border.all(width: 3, color: AppColors.yellow)
                    : null,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Image.asset(AppImages.us, height: 25, width: 25),
            ),
          ),
        ],
      ),
    );
  }
}
