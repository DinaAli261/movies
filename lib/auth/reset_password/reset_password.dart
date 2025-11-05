import 'package:flutter/material.dart';
import 'package:movies/utils/app_colors.dart';
import 'package:movies/utils/app_images.dart';
import 'package:movies/utils/app_text_styles.dart';
import 'package:movies/widgets/custom_elevated_button.dart';
import 'package:movies/widgets/custom_text_form_filed.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmNewPasswordController = TextEditingController();
  bool isObscureOld = true;
  bool isObscureNew = true;
  bool isObscureConfirm = true;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text("Reset Password", style: AppTextStyles.regular16Yellow),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 0.037 * width,
          vertical: 0.025 * height,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomTextFormField(
              controller: oldPasswordController,
              hintText: " Old Password",
              hintStyle: AppTextStyles.regular15White,
              obscureText: isObscureOld,
              prefixIcon: ImageIcon(
                AssetImage(AppImages.passwordIcon),
                color: AppColors.white,
              ),
              suffixIcon: InkWell(
                onTap: () {
                  isObscureOld = !isObscureOld;
                  setState(() {});
                },
                child: (isObscureOld)
                    ? ImageIcon(
                        AssetImage(AppImages.passwordIcon2),
                        color: AppColors.white,
                      )
                    : Icon(Icons.remove_red_eye, color: AppColors.white),
              ),
            ),

            CustomTextFormField(
              controller: newPasswordController,
              hintText: "New Password",
              hintStyle: AppTextStyles.regular15White,
              obscureText: isObscureNew,
              prefixIcon: ImageIcon(
                AssetImage(AppImages.passwordIcon),
                color: AppColors.white,
              ),
              suffixIcon: InkWell(
                onTap: () {
                  isObscureNew = !isObscureNew;
                  setState(() {});
                },
                child: (isObscureNew)
                    ? ImageIcon(
                        AssetImage(AppImages.passwordIcon2),
                        color: AppColors.white,
                      )
                    : Icon(Icons.remove_red_eye, color: AppColors.white),
              ),
            ),
            CustomTextFormField(
              controller: confirmNewPasswordController,
              hintText: "Confirm New Password",
              hintStyle: AppTextStyles.regular15White,
              obscureText: isObscureConfirm,
              prefixIcon: ImageIcon(
                AssetImage(AppImages.passwordIcon),
                color: AppColors.white,
              ),
              suffixIcon: InkWell(
                onTap: () {
                  isObscureConfirm = !isObscureConfirm;
                  setState(() {});
                },
                child: (isObscureConfirm)
                    ? ImageIcon(
                        AssetImage(AppImages.passwordIcon2),
                        color: AppColors.white,
                      )
                    : Icon(Icons.remove_red_eye, color: AppColors.white),
              ),
            ),
            CustomElevatedButton(
              text: "Reset Password",
              textStyle: AppTextStyles.regular20Black,
              onPressed: () {
                //todo: reset password button
              },
            ),
          ],
        ),
      ),
    );
  }
}
