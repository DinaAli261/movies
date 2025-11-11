import 'package:flutter/material.dart';
import 'package:movies/l10n/app_localizations.dart';
import 'package:movies/utils/app_colors.dart';
import 'package:movies/utils/app_images.dart';
import 'package:movies/utils/app_text_styles.dart';
import 'package:movies/widgets/custom_elevated_button.dart';
import 'package:movies/widgets/custom_text_form_filed.dart';

class ForgetPassword extends StatefulWidget {

  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final TextEditingController _emailController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RegExp emailRegEx = RegExp(r"^[\w.-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$");

  @override
  void dispose()

  {
    _emailController.dispose();

    super
        .
    dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.forget_password,
            style: AppTextStyles.regular16Yellow),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
        child: Form(
          key: formKey,
          child: Column(
            spacing: 24,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(AppImages.forgetPassword),
              CustomTextFormField(
                validator: (txt) {
                  if (txt == null || txt.isEmpty) {
                    return AppLocalizations.of(context)!
                        .please_enter_your_email;
                  }
                  else if (!emailRegEx.hasMatch(txt)) {
                    return AppLocalizations.of(context)!
                        .please_enter_a_valid_email;
                  }
                  return null;
                },
                controller: _emailController,
                hintText: AppLocalizations.of(context)!.email,
                prefixIcon: ImageIcon(
                  AssetImage(AppImages.emailIcon), color: AppColors.white,),
              ),
              CustomElevatedButton(
                  text: AppLocalizations.of(context)!.verify_email,
                  onPressed: _verifyEmail),
            ],
          ),
        ),
      ),
    );
  }

  void _verifyEmail() {
    if (formKey.currentState!.validate()) {}
  }
}