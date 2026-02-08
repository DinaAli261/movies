import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_images.dart';
import '../providers/app_language_provider.dart';
import '../utils/shared_preferences_helper.dart';

class ChooseLanguage extends StatefulWidget {
  const ChooseLanguage({super.key});

  @override
  State<ChooseLanguage> createState() => _ChooseLanguageState();
}

class _ChooseLanguageState extends State<ChooseLanguage> {
  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    bool isSelectedAr = languageProvider.appLanguage == "ar";
    bool isSelectedEN = languageProvider.appLanguage == "en";
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
                languageProvider.changeLanguage("ar");
                saveLastLang("ar");
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
                languageProvider.changeLanguage("en");
                saveLastLang("en");
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
