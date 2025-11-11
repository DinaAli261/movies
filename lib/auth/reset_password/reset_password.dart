import 'package:flutter/material.dart';
import 'package:movies/l10n/app_localizations.dart';
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
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    oldPasswordController.dispose();
    newPasswordController.dispose();
    confirmNewPasswordController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.reset_password,
            style: AppTextStyles.regular16Yellow),
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
              CustomTextFormField(
                controller: oldPasswordController,
                hintText: AppLocalizations.of(context)!.old_password,
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
                //todo: update validator from api
                validator: (text) {
                  if (text == null || text
                      .trim()
                      .isEmpty) {
                    return AppLocalizations.of(context)!.please_enter_password;
                  }
                  if (text.length < 6) {
                    return AppLocalizations.of(context)!
                        .password_should_be_at_least_6_chars;
                  }
                  return null;
                },
              ),

              CustomTextFormField(
                controller: newPasswordController,
                hintText: AppLocalizations.of(context)!.new_password,
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
                validator: (text) {
                  if (text == null || text
                      .trim()
                      .isEmpty) {
                    return AppLocalizations.of(context)!.please_enter_password;
                  }
                  if (text.length < 6) {
                    return AppLocalizations.of(context)!
                        .password_should_be_at_least_6_chars;
                  }
                  return null;
                },
              ),
              CustomTextFormField(
                controller: confirmNewPasswordController,
                hintText: AppLocalizations.of(context)!.confirm_new_password,
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
                validator: (text) {
                  if (text == null || text
                      .trim()
                      .isEmpty) {
                    return AppLocalizations.of(context)!.please_enter_password;
                  }
                  if (text != newPasswordController.text) {
                    return AppLocalizations.of(context)!
                        .this_password_is_incorrect;
                  }
                  return null;
                },
              ),
              CustomElevatedButton(
                  text: AppLocalizations.of(context)!.reset_password,
                  textStyle: AppTextStyles.regular20Black,
                  onPressed: resetPassword
              ),
            ],
          ),
        ),
      ),
    );
  }

  void resetPassword() {
    if (_formKey.currentState?.validate() == true) {
      //todo register
    }
  }
}
