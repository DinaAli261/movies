import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies/utils/app_images.dart';
import 'package:movies/utils/app_routes.dart';
import 'package:movies/utils/app_text_styles.dart';
import 'package:movies/widgets/choose_language.dart';
import 'package:movies/widgets/custom_elevated_button.dart';
import 'package:movies/widgets/custom_text_button.dart';
import 'package:movies/widgets/custom_text_form_filed.dart';

import '../../utils/app_colors.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool isObsecureConfirmPassword = true;
  bool isObsecurePassword = true;
  List<String> avatars = [
    AppImages.avatar1,
    AppImages.avatar2,
    AppImages.avatar3,
    AppImages.avatar4,
    AppImages.avatar5,
    AppImages.avatar6,
    AppImages.avatar7,
    AppImages.avatar8,
    AppImages.avatar9,
  ];
  int currentIndex = 0;
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('Register', style: AppTextStyles.regular16Yellow),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 0.037 * width,
          vertical: 0.025 * height,
        ),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: height * 0.17,
                  child: CarouselSlider.builder(
                    options: CarouselOptions(
                      height: height * 0.17,
                      enlargeCenterPage: true,
                      viewportFraction: 0.35,
                      enableInfiniteScroll: true,
                      onPageChanged: (index, reason) {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                    ),

                    itemCount: avatars.length,
                    itemBuilder: (context, index, realIndex) {
                      bool isCenter = index == currentIndex;
                      double size = isCenter ? width * 0.4 : width * 0.2;

                      return AnimatedContainer(
                        duration: Duration(microseconds: 300),
                        alignment: Alignment.center,
                        child: Container(
                          width: size,
                          height: size,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(avatars[index]),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Text(
                  'Avatar',
                  style: AppTextStyles.regular16White,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: height * 0.02),

                CustomTextFormField(
                  controller: name,
                  hintText: 'Name',

                  prefixIcon: Image.asset(AppImages.updateNameIcon),
                  validator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return 'Please Enter your Name';
                    }
                    return null;
                  },
                ), //Name
                CustomTextFormField(
                  controller: email,
                  hintText: 'Email',
                  prefixIcon: Image.asset(AppImages.emailIcon),
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'please Enter your Email';
                    }
                    bool emailRegEx = RegExp(
                      r"^[\w.-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$",
                    ).hasMatch(text);
                    if (!emailRegEx) {
                      return 'invalid Email';
                    }
                    return null;
                  },
                ), //email
                CustomTextFormField(
                  controller: password,
                  hintText: 'Password',
                  hintStyle: AppTextStyles.regular15White,
                  prefixIcon: Image.asset(AppImages.passwordIcon),
                  obscureText: isObsecurePassword,
                  validator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return 'please Enter password';
                    }
                    if (text.length < 6) {
                      return 'password less than 6 character ';
                    }
                    return null;
                  },
                  suffixIcon: GestureDetector(
                    onTap: () {
                      isObsecurePassword = !isObsecurePassword;
                      setState(() {});
                    },
                    child: isObsecurePassword
                        ? Image.asset(AppImages.passwordIcon2)
                        : Icon(
                            Icons.remove_red_eye_rounded,
                            color: AppColors.white,
                            size: 30,
                          ),
                  ),
                ), //password
                CustomTextFormField(
                  controller: confirmPassword,
                  hintText: 'Confirm Password',
                  prefixIcon: Image.asset(AppImages.passwordIcon),
                  hintStyle: AppTextStyles.regular15White,
                  obscureText: isObsecureConfirmPassword,
                  validator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return 'Please Enter your password ';
                    }
                    if (text != password.text) {
                      return 'This password is incorrect.';
                    }
                  },
                  suffixIcon: GestureDetector(
                    onTap: () {
                      isObsecureConfirmPassword = !isObsecureConfirmPassword;
                      setState(() {});
                    },
                    child: isObsecureConfirmPassword
                        ? Image.asset(AppImages.passwordIcon2)
                        : Icon(
                            Icons.remove_red_eye_rounded,
                            color: AppColors.white,
                            size: 30,
                          ),
                  ),
                ), //confirmPassword
                CustomTextFormField(
                  controller: phoneNumber,
                  hintText: 'Phone Number',
                  prefixIcon: Image.asset(AppImages.phoneIcon),
                  validator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return 'Please Enter your PhoneNumber';
                    }
                    return null;
                  },
                ), //phone
                CustomElevatedButton(
                  text: 'Create Account',
                  onPressed: register,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already Have Account?',
                      style: AppTextStyles.regular14White,
                    ),
                    CustomTextButton(
                      text: 'Login',
                      onPressed: () {
                        //todo login
                        Navigator.of(
                          context,
                        ).pushNamed(AppRoutes.loginRouteName);
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [ChooseLanguage(isLang: true)],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void register() {
    if (_formKey.currentState?.validate() == true) {
      //todo register
    }
  }
}
