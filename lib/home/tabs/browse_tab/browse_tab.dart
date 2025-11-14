import 'package:flutter/material.dart';
import 'package:movies/l10n/app_localizations.dart';
import 'package:movies/utils/app_colors.dart';
import 'package:movies/utils/app_text_styles.dart';

class BrowseTab extends StatefulWidget {
  const BrowseTab({super.key});

  @override
  State<BrowseTab> createState() => _BrowseTabState();
}

class _BrowseTabState extends State<BrowseTab> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<String> tabsName = [
      AppLocalizations.of(context)!.adventure,
      AppLocalizations.of(context)!.animation,
      AppLocalizations.of(context)!.comedy,
      AppLocalizations.of(context)!.family,
      AppLocalizations.of(context)!.fantasy
    ];
    final width = MediaQuery
        .of(context)
        .size
        .width;
    final height = MediaQuery
        .of(context)
        .size
        .height;
    return Scaffold(
        body: Padding(
          padding: EdgeInsets.only(
            top: 0.06 * height,
            left: 0.037 * width,
            right: 0.037 * width,
          ),
          child: Column(
            children: [
              DefaultTabController(length: tabsName.length,
                child: TabBar(
                  tabAlignment: TabAlignment.start,
                  labelPadding: EdgeInsets.only(right: width * 0.019),
                  isScrollable: true,
                  dividerColor: AppColors.transparent,
                  labelStyle: AppTextStyles.bold20Black,
                  unselectedLabelStyle: AppTextStyles.bold20Yellow,
                  indicator: BoxDecoration(
                    color: AppColors.yellow,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  tabs: tabsName.map((text) {
                    return Container(
                        padding: EdgeInsets.symmetric(vertical: height * 0.013,
                            horizontal: 0.032 * width),
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.yellow,
                            ),
                            borderRadius: BorderRadius.circular(16)
                        ),
                        child: Text(text));
                  },).toList(),
                ),
              ),
              Expanded(child: GridView.builder(
                padding: EdgeInsets.only(top: height * 0.027),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: height * 0.009,
                    crossAxisSpacing: 0.037 * width,
                    childAspectRatio: 191 / 297
                ),
                itemBuilder: (context, index) {
                  //todo : reusable widget movie from api
                  return Container(
                    height: 297, width: 191,
                    color: AppColors.yellow,
                  );
                },))
            ],
          ),
        )
    );
  }
}
