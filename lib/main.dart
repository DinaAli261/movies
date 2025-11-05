import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:movies/auth/forget_password/forget_password.dart';
import 'package:movies/auth/login/login.dart';
import 'package:movies/auth/register/register.dart';
import 'package:movies/auth/reset_password/reset_password.dart';
import 'package:movies/home/home_screen.dart';
import 'package:movies/movie_details/movie_details.dart';
import 'package:movies/on_boarding/on_boarding.dart';
import 'package:movies/update_profile/update_profile.dart';
import 'package:movies/utils/app_routes.dart';
import 'package:movies/utils/app_theme.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  FlutterNativeSplash.remove();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.resetPasswordRouteName,
      routes: {
        AppRoutes.onBoardingRouteName: (context) => OnBoarding(),
        AppRoutes.homeScreenRouteName: (context) => HomeScreen(),
        AppRoutes.loginRouteName: (context) => Login(),
        AppRoutes.registerRouteName: (context) => Register(),
        AppRoutes.forgetPasswordRouteName: (context) => ForgetPassword(),
        AppRoutes.resetPasswordRouteName: (context) => ResetPassword(),
        AppRoutes.updateProfileRouteName: (context) => UpdateProfile(),
        AppRoutes.movieDetailsRouteName: (context) => MovieDetails()
      },
      themeMode: ThemeMode.dark,
      theme: AppTheme.darkTheme,
    );
  }
}
