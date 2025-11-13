import 'package:flutter/material.dart';
import 'package:movies/home/tabs/profile_tab/widget/custom_details.dart';
import 'package:movies/home/tabs/profile_tab/widget/custom_tap.dart';
import 'package:movies/providers/user_provider.dart';
import 'package:movies/utils/app_colors.dart';
import 'package:movies/utils/app_images.dart';
import 'package:movies/utils/app_text_styles.dart';
import 'package:movies/widgets/custom_elevated_button.dart';
import 'package:provider/provider.dart';





class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  //todo: navigate to update profile
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery
        .of(context)
        .size
        .height;
    var width = MediaQuery
        .of(context)
        .size
        .width;
    var userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.only(
                  bottom: 0,
                  top: height * 0.07,
                  right: width * 0.04,
                  left: width * 0.04
              ),
              color: AppColors.grey,
              child: Column(

                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset(AppImages.avatar1),
                      CustomDetails(text: 'Watch List', num: '12'),
                      CustomDetails(text: 'History', num: '10')

                    ],
                  ),
                  SizedBox(height: height * 0.02,),
                  Text(userProvider.currentUser?.name ?? '',
                    style: AppTextStyles.bold20White,),
                  SizedBox(height: height * 0.02,),
                  Row(
                    children: [
                      Expanded(
                          flex: 2,
                          child: CustomElevatedButton(
                              text: 'Edit Profile',
                              backgroundColor: AppColors.yellow,
                              onPressed: () {}
                          )),
                      SizedBox(
                        width: width * 0.04,
                      ),
                      Expanded(
                          child: CustomElevatedButton(
                              text: 'Exit',
                              textStyle: AppTextStyles.regular20White,
                              suffixIcon: Image.asset(
                                AppImages.exitIcon, color: AppColors.white,),
                              backgroundColor: AppColors.red,
                              borderColor: AppColors.transparent,
                              hasSuffixIcon: true,
                              onPressed: () {}
                          )),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.04,
                  ),
                  DefaultTabController(
                      length: 2,
                      child: TabBar(
                          indicatorColor: AppColors.yellow,
                          dividerColor: AppColors.transparent,
                          tabs: [
                            CustomTap(image: AppImages.watchListIcon,
                                text: 'Watch List'),
                            CustomTap(
                                image: AppImages.historyIcon, text: 'History')

                          ]

                      ))


                ],
              ),
            ),


            Image.asset(AppImages.emptyIcon)


          ],
        )


    );
  }
}
