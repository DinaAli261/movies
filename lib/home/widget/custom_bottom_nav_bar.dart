import 'package:flutter/material.dart';
import 'package:movies/utils/app_colors.dart';

import '../../utils/app_images.dart';

class CustomBottomNavBar extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onIconSelected; // call back function
  CustomBottomNavBar({
    required this.onIconSelected,
    required this.selectedIndex,
    super.key,
  });

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsetsGeometry.only(
        left: width * 0.02,
        right: width * 0.02,
        bottom: height * 0.02,
      ),
      decoration: BoxDecoration(
        color: AppColors.grey,
        borderRadius: BorderRadiusGeometry.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          buildNavItem(AppImages.homeIcon, 0, height),
          buildNavItem(AppImages.searchIcon, 1, height),
          buildNavItem(AppImages.browseIcon, 2, height),
          buildNavItem(AppImages.profileIcon, 3, height),
        ],
      ),
    );
  }

  Widget buildNavItem(String image, int index, double height) {
    bool isSelected = (widget.selectedIndex == index);
    return GestureDetector(
      onTap: () {
        widget.onIconSelected(index); // call back calling
        setState(() {});
      },
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(vertical: height * 0.02),
        child: ImageIcon(
          AssetImage(image),
          color: (isSelected) ? AppColors.yellow : AppColors.white,
          size: 24,
        ),
      ),
    );
  }
}
