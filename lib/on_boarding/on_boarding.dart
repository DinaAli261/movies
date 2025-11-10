import 'package:flutter/material.dart';
import 'package:movies/l10n/app_localizations.dart';
import 'package:movies/utils/app_colors.dart';
import 'package:movies/utils/app_images.dart';
import 'package:movies/widgets/custom_elevated_button.dart';

import '../utils/app_routes.dart';
import '../utils/app_text_styles.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  late int currentIndex;
  final PageController _pageController = PageController();

  @override
  void initState() {
    currentIndex = 0;
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  List<String> onBoardingImgs = [
    AppImages.onBoarding1,
    AppImages.onBoarding2,
    AppImages.onBoarding3,
    AppImages.onBoarding4,
    AppImages.onBoarding5,
    AppImages.onBoarding6,
  ];

  List<String> onBoardingTitle = [];

  List<List<Color>> gradientColors = [
    [
      AppColors.transparent,
      AppColors.blackGradient1,
      AppColors.blackGradient2,
      AppColors.blackGradient3,
    ],
    [AppColors.transparent, AppColors.tealGradient],
    [AppColors.transparent, AppColors.pinkGradient],
    [AppColors.transparent, AppColors.purpleGradient],
    [AppColors.transparent, AppColors.redGradient],
    [AppColors.transparent, AppColors.grayGradient],
  ];
  List<String> onBoardingBody = [];
  void _nextPage() {
    if (currentIndex < onBoardingImgs.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      // TODO: Navigate to the next phase
      Navigator.of(context).pushReplacementNamed(AppRoutes.loginRouteName);
    }
  }

  void _previousPage() {
    if (currentIndex > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  Widget _buildPage(int index) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        // Background Image
        Image.asset(
          onBoardingImgs[index],
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),

        // Gradient Overlay
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: gradientColors[index],
              stops: List.generate(
                gradientColors[index].length,
                (i) => i / (gradientColors[index].length - 1),
              ),
            ),
          ),
        ),

        // Content
        if (index == 0)
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  onBoardingTitle[index],
                  style: AppTextStyles.medium36White,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                Text(
                  onBoardingBody[index],
                  style: AppTextStyles.regular20LightGrey,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                CustomElevatedButton(text: "Explore Now", onPressed: _nextPage),
                const SizedBox(height: 32),
              ],
            ),
          )
        else
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
            decoration: BoxDecoration(
              color: AppColors.black,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  onBoardingTitle[index],
                  style: AppTextStyles.bold24White,
                  textAlign: TextAlign.center,
                ),
                if (index != onBoardingImgs.length - 1) ...[
                  const SizedBox(height: 16),
                  Text(
                    onBoardingBody[index],
                    style: AppTextStyles.regular20White,
                    textAlign: TextAlign.center,
                  ),
                ],
                const SizedBox(height: 24),
                CustomElevatedButton(
                  text: index == onBoardingImgs.length - 1
                      ? AppLocalizations.of(context)!.finish
                      : AppLocalizations.of(context)!.next,
                  onPressed: _nextPage,
                ),
                if (index != 1) ...[
                  const SizedBox(height: 16),
                  CustomElevatedButton(
                    text: AppLocalizations.of(context)!.back,
                    textStyle: AppTextStyles.semibold20Yellow,
                    onPressed: _previousPage,
                    borderColor: AppColors.yellow,
                    backgroundColor: Colors.transparent,
                  ),
                ],
              ],
            ),
          ),
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    onBoardingTitle = [
      AppLocalizations.of(context)!.on_boarding_title1,
      AppLocalizations.of(context)!.on_boarding_title2,
      AppLocalizations.of(context)!.on_boarding_title3,
      AppLocalizations.of(context)!.on_boarding_title4,
      AppLocalizations.of(context)!.on_boarding_title5,
      AppLocalizations.of(context)!.on_boarding_title6,
    ];
    onBoardingBody = [
      AppLocalizations.of(context)!.on_boarding_body1,
      AppLocalizations.of(context)!.on_boarding_body2,
      AppLocalizations.of(context)!.on_boarding_body3,
      AppLocalizations.of(context)!.on_boarding_body4,
      AppLocalizations.of(context)!.on_boarding_body5,
    ];
    return Scaffold(
      body: PageView.builder(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        itemCount: onBoardingImgs.length,
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        itemBuilder: (context, index) => _buildPage(index),
      ),
    );
  }
}
