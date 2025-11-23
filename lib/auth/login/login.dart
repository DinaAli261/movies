import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:movies/api/api_manager.dart';
import 'package:movies/l10n/app_localizations.dart';
import 'package:movies/model/my_user.dart';
import 'package:movies/utils/app_images.dart';
import 'package:movies/widgets/choose_language.dart';
import 'package:provider/provider.dart';

import '../../helpers/token_manager.dart';
import '../../providers/user_provider.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_routes.dart';
import '../../utils/app_text_styles.dart';
import '../../utils/dialog_utils.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_button.dart';
import '../../widgets/custom_text_form_filed.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();
  late UserProvider userProvider;




  TextEditingController emailController = TextEditingController(
    text: 'malak.ahmed91@gmail.com',
  );

  TextEditingController passwordController = TextEditingController(
    text: 'Malak123@',
  );
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    userProvider = Provider.of<UserProvider>(context);
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
                        hintText: AppLocalizations.of(context)!.email,
                        hintStyle: AppTextStyles.regular15White,
                        prefixIcon: ImageIcon(
                          AssetImage(AppImages.emailIcon),
                          color: AppColors.white,
                        ),
                        controller: emailController,
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return AppLocalizations.of(
                              context,
                            )!.please_enter_your_email;
                          }
                          final bool emailValid = RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                          ).hasMatch(text);
                          if (!emailValid) {
                            return AppLocalizations.of(
                              context,
                            )!.please_enter_a_valid_email;
                          }
                          return null;
                        },
                      ),
                      CustomTextFormField(
                        hasPadding: false,
                        controller: passwordController,
                        hintText: AppLocalizations.of(context)!.password,
                        hintStyle: AppTextStyles.regular15White,
                        obscureText: isObscure,
                        prefixIcon: ImageIcon(
                          AssetImage(AppImages.passwordIcon),
                          color: AppColors.white,
                        ),
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return AppLocalizations.of(
                              context,
                            )!.please_enter_password;
                          }
                          if (text.length < 6) {
                            return AppLocalizations.of(
                              context,
                            )!.password_should_be_at_least_6_chars;
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
                            Navigator.of(
                              context,
                            ).pushNamed(AppRoutes.forgetPasswordRouteName);
                          },
                          text: AppLocalizations.of(context)!.forget_password_q,
                          textStyle: AppTextStyles.regular14Yellow,
                        ),
                      ),
                      SizedBox(height: height * 0.02),
                      CustomElevatedButton(
                        onPressed: login,
                        text: AppLocalizations.of(context)!.login,
                        textStyle: AppTextStyles.regular20Grey,
                      ),
                      SizedBox(height: height * 0.01),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${AppLocalizations.of(context)!.do_not_have_account}  ',
                            style: AppTextStyles.regular14White,
                          ),
                          CustomTextButton(
                            onPressed: () {
                              Navigator.of(
                                context,
                              ).pushNamed(AppRoutes.registerRouteName);
                            },
                            text: AppLocalizations.of(context)!.create_one,
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
                          Text(
                            AppLocalizations.of(context)!.or,
                            style: AppTextStyles.regular15Yellow,
                          ),
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
                        text: AppLocalizations.of(context)!.login_with_google,
                        textStyle: AppTextStyles.regular16Grey,
                        onPressed: () async {
                          //todo  login with google
                          signInWithGoogle();
                        },
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
                        children: [ChooseLanguage()],
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

  Future<void> signInWithGoogle() async {

    try {
      final GoogleSignIn signIn = GoogleSignIn.instance;
      signIn.initialize(
        serverClientId:
            "121281015-l0kbclehoone64jcmliknlkbtlj1pjq8.apps.googleusercontent.com",
      );

      final GoogleSignInAccount? googleUser = await GoogleSignIn.instance
          .authenticate();
      if (googleUser == null) {
        return;
      }

      final GoogleSignInAuthentication googleAuth = googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );

      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithCredential(credential);
      var firebaseUser = userCredential.user;
      MyUser myUser = MyUser(id: firebaseUser?.uid ?? '',
          email: firebaseUser?.email ?? '',
          name: firebaseUser?.displayName ?? '',
          phone: firebaseUser?.phoneNumber ?? '',
          avaterId: null ?? 0);
      userProvider.updateUser(myUser);
      DialogUtils.showMessage(
        context: context,
        message: 'Login with Google Successfully',
        posName: 'ok',
        posAction: () {
          Navigator.of(context).pushNamed(AppRoutes.homeScreenRouteName);
        },
      );
    } catch (e) {
      DialogUtils.showMessage(
        context: context,
        message: e.toString(),
        title: 'login failed',
        posName: 'ok',
      );
    }
  }

  void login() async {
    if (formKey.currentState?.validate() == true) {
      try {
        DialogUtils.showLoading(context: context, message: 'Loading...');
        final response = await ApiManager.login(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );

        bool isSuccess =
            response.statusCode == 200 &&
            response.message.toString().toLowerCase().contains("login");

        if (isSuccess) {
          await UserManager.saveToken(response.data);
          print("TOKEN SAVED: ${response.data}");
        }
        DialogUtils.hideLoading(context);
        DialogUtils.showMessage(
          context: context,
          title: isSuccess ? "Success" : "Error",
          message: response.message ?? response.error ?? "Something went wrong",
          posName: "OK",
          posAction: isSuccess
              ? () {
                  Navigator.of(
                    context,
                  ).pushReplacementNamed(AppRoutes.homeScreenRouteName);
                }
              : null,
        );
      } catch (e) {
        Navigator.of(context).pop();
        DialogUtils.showMessage(
          context: context,
          title: "Error",
          message: e.toString(),
          posName: "OK",
        );
      }
    }
  }
}