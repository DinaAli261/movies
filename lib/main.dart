import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
import 'firebase_options.dart';
import 'bloc/language_bloc.dart';
import 'bloc/language_state.dart';
import 'l10n/app_localizations.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  FlutterNativeSplash.remove();
  runApp(BlocProvider(
    create: (context) => LanguageBloc(),
    child: MyApp(),
  ),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageBloc, LanguageState>(
      builder: (context, state) {
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(state.currentLanguage),
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.onBoardingRouteName,
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
      },
    );
  }
}