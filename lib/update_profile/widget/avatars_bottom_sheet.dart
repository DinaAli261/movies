import 'package:flutter/material.dart';
import 'package:movies/model/account.dart';
import 'package:movies/utils/app_colors.dart';

class AvatarsBottomSheet extends StatefulWidget {
  //todo: from api
  static int selectedIndex = 7; // هنغير القيمه دي مش هتكون ثابته بعد ال api

  final Function(int)
  onAvatarSelected; //call back عشان تسمع التغييرات في نفس الوقت

  AvatarsBottomSheet({super.key, required this.onAvatarSelected});

  @override
  State<AvatarsBottomSheet> createState() => _AvatarsBottomSheetState();
}

class _AvatarsBottomSheetState extends State<AvatarsBottomSheet> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.037,
        vertical: height * 0.017,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.grey,
          borderRadius: BorderRadiusGeometry.circular(24),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            getRow(0, height, width),
            getRow(3, height, width),
            getRow(6, height, width),
          ],
        ),
      ),
    );
  }

  Widget getRow(int i, double height, double width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        getContainer(Image.asset(Account.avatars[i]), height, width, i),
        getContainer(Image.asset(Account.avatars[i + 1]), height, width, i + 1),
        getContainer(Image.asset(Account.avatars[i + 2]), height, width, i + 2),
      ],
    );
  }

  Widget getContainer(Image image, double height, double width, int index) {
    bool isSelected = AvatarsBottomSheet.selectedIndex == index;
    return InkWell(
      onTap: () {
        AvatarsBottomSheet.selectedIndex = index;
        widget.onAvatarSelected(index); // call back calling
        Navigator.pop(context); //لما يختار يقفل الbottom sheet
        setState(() {});
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.023,
          vertical: height * 0.0107,
        ),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.yellow : AppColors.transparent,
          borderRadius: BorderRadiusGeometry.circular(20),
          border: Border.all(color: AppColors.yellow, width: 1),
        ),
        child: image,
      ),
    );
  }
}
