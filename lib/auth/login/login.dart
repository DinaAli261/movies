import 'package:flutter/material.dart';
import 'package:movies/utils/app_images.dart';
import 'package:movies/widgets/choose_language.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_routes.dart';
import '../../utils/app_text_styles.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_button.dart';
import '../../widgets/custom_text_form_filed.dart';

class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController(
    text: 'route@email.com',
  );

  TextEditingController passwordController = TextEditingController(
    text: '123456',
  );
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.04),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(AppImages.loginLogo),
                SizedBox(height: height * 0.07),
                Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CustomTextFormField(
                        hintText: "Email",
                        hintStyle: AppTextStyles.regular15White,
                        prefixIcon: ImageIcon(
                          AssetImage(AppImages.emailIcon),
                          color: AppColors.white,
                        ),
                        controller: emailController,
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return 'Please enter email';
                          }
                          final bool emailValid = RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                          ).hasMatch(text);
                          if (!emailValid) {
                            return 'Please enter valid email';
                          }
                          return null;
                        },
                      ),
                      CustomTextFormField(
                        hasPadding: false,
                        controller: passwordController,
                        hintText: "Password",
                        hintStyle: AppTextStyles.regular15White,
                        obscureText: isObscure,
                        prefixIcon: ImageIcon(
                          AssetImage(AppImages.passwordIcon),
                          color: AppColors.white,
                        ),
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return 'Please enter password';
                          }
                          if (text.length < 6) {
                            return 'Password should be at least 6 chars.';
                          }
                          return null;
                        },
                        suffixIcon: InkWell(
                          onTap: () {
                            isObscure = !isObscure;
                            setState(() {});
                          },
                          child: (isObscure)
                              ? ImageIcon(
                                  AssetImage(AppImages.passwordIcon2),
                                  color: AppColors.white,
                                )
                              : Icon(
                                  Icons.remove_red_eye,
                                  color: AppColors.white,
                                ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentGeometry.centerRight,
                        child: CustomTextButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed(
                                AppRoutes.forgetPasswordRouteName);
                          },
                          text: "Forget Password ?",
                          textStyle: AppTextStyles.regular14Yellow,
                        ),
                      ),
                      SizedBox(height: height * 0.02),
                      CustomElevatedButton(
                        onPressed: login,
                        text: "Login",
                        textStyle: AppTextStyles.regular20Grey,
                      ),
                      SizedBox(height: height * 0.01),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't Have Account ? ",
                            style: AppTextStyles.regular14White,
                          ),
                          CustomTextButton(
                            onPressed: () {
                              Navigator.of(
                                context,
                              ).pushNamed(AppRoutes.registerRouteName);
                            },
                            text: 'Create One',
                            textStyle: AppTextStyles.black14Yellow,
                          ),
                        ],
                      ),
                      SizedBox(height: height * 0.02),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: width * 0.26,
                            child: Divider(
                              color: AppColors.yellow,
                              thickness: 1,
                            ),
                          ),
                          SizedBox(width: width * 0.02),
                          Text("OR", style: AppTextStyles.regular15Yellow),
                          SizedBox(width: width * 0.02),
                          SizedBox(
                            width: width * 0.26,
                            child: Divider(
                              color: AppColors.yellow,
                              thickness: 1,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: height * 0.03),
                      CustomElevatedButton(
                        text: "Login With Google",
                        textStyle: AppTextStyles.regular16Grey,
                        onPressed: () {},
                        hasPrefixIcon: true,
                        prefixIcon: ImageIcon(
                          AssetImage(AppImages.googleIcon),
                          color: AppColors.black,
                          size: 26,
                        ),
                      ),
                      SizedBox(height: height * 0.03),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [ChooseLanguage(isLang: false)],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void login() {
    if (formKey.currentState?.validate() == true) {
      //todo:update navigator to home
      //todo:update pushReplacementNamed
      Navigator.of(context).pushNamed(AppRoutes.updateProfileRouteName);
    }
  }
}