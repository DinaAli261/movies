import 'package:flutter/material.dart';
import 'package:movies/model/account.dart';
import 'package:movies/update_profile/widget/avatars_bottom_sheet.dart';
import 'package:movies/utils/app_colors.dart';
import 'package:movies/utils/app_images.dart';
import 'package:movies/utils/app_text_styles.dart';
import 'package:movies/widgets/custom_elevated_button.dart';
import 'package:movies/widgets/custom_text_button.dart';
import 'package:movies/widgets/custom_text_form_filed.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({super.key});

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery
        .of(context)
        .size
        .width;
    final height = MediaQuery
        .of(context)
        .size
        .height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Pick Avatar", style: AppTextStyles.regular16Yellow,),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 0.037 * width,
          vertical: 0.025 * height,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              InkWell(
                  onTap: () {
                    showAvatarsBottomSheet(height);
                  },
                  child: Image.asset(
                    Account.avatars[AvatarsBottomSheet.selectedIndex],
                    width: 0.35 * width,
                    height: 0.16 * height,
                    fit: BoxFit.fitHeight,)),
              SizedBox(height: height * 0.037),
              CustomTextFormField(controller: nameController,
                hintText: "Profile Name",
                hintStyle: AppTextStyles.regular20White,
                prefixIcon: ImageIcon(AssetImage(AppImages.updateNameIcon),
                  color: AppColors.white,),
                //todo: update validator from api
                validator: (text) {
                  if (text == null || text
                      .trim()
                      .isEmpty) {
                    return 'Please Enter your Name';
                  }
                  return null;
                },
              ),
              CustomTextFormField(
                controller: phoneController,
                hintText: "Phone",
                hintStyle: AppTextStyles.regular20White,
                prefixIcon: ImageIcon(
                  AssetImage(AppImages.phoneIcon), color: AppColors.white,),
                //todo: update validator from api
                validator: (text) {
                  if (text == null || text
                      .trim()
                      .isEmpty) {
                    return 'Please Enter your Phone Number';
                  }
                  return null;
                },
              ),
              Align(
                  alignment: AlignmentGeometry.centerLeft,
                  child: CustomTextButton(text: "Reset Password",
                      textStyle: AppTextStyles.regular20White,
                      onPressed: () {})),
              Spacer(),
              CustomElevatedButton(text: "Delete Account",
                textStyle: AppTextStyles.regular20White,
                onPressed: () {},
                backgroundColor: AppColors.red,
                borderColor: AppColors.red,),
              SizedBox(height: height * 0.02),
              CustomElevatedButton(text: "Update Account",
                  textStyle: AppTextStyles.regular20Black,
                  onPressed: () {
                    updateAccount();
                  }),
              SizedBox(height: height * 0.02),
            ],
          ),
        ),
      ),
    );
  }

  showAvatarsBottomSheet(double height) {
    showModalBottomSheet(
      backgroundColor: AppColors.transparent,
      constraints: BoxConstraints(maxHeight: height * 0.45),
      context: context,
      builder: (context) =>
          AvatarsBottomSheet(
            onAvatarSelected: (index) {
              AvatarsBottomSheet.selectedIndex = index;
              setState(() {

              });
            },
          ),
    );
  }

  void updateAccount() {
    if (_formKey.currentState?.validate() == true) {
      //todo register
    }
  }
}
