import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:movies/auth/forget_password/forget_password.dart';
import 'package:movies/auth/login/login.dart';
import 'package:movies/auth/register/register.dart';
import 'package:movies/auth/reset_password/reset_password.dart';
import 'package:movies/home/home_screen.dart';
import 'package:movies/movie_details/movie_details.dart';
import 'package:movies/on_boarding/on_boarding.dart';
import 'package:movies/providers/app_language_provider.dart';
import 'package:movies/providers/user_provider.dart';
import 'package:movies/update_profile/update_profile.dart';
import 'package:movies/utils/app_routes.dart';
import 'package:movies/utils/app_theme.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';
import 'helpers/token_manager.dart';
import 'l10n/app_localizations.dart';
import 'model/my_user.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final userData = await UserManager.getUserData();
  MyUser? currentUser;
  if (userData.isNotEmpty && userData['id'] != null) {
    currentUser = MyUser(
      id: userData['id'],
      name: userData['name'],
      email: userData['email'],
      phone: userData['phone'],
      avaterId: userData['avaterId'] ?? 1,
    );
  }

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  FlutterNativeSplash.remove();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AppLanguageProvider()),
        ChangeNotifierProvider(
          create: (_) => UserProvider()..updateUser(currentUser!),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(languageProvider.appLanguage),
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.onBoardingRouteName,
      routes: {
        AppRoutes.onBoardingRouteName: (context) => OnBoarding(),
        AppRoutes.homeScreenRouteName: (context) => HomeScreen(),
        AppRoutes.loginRouteName: (context) => Login(),
        AppRoutes.registerRouteName: (context) => Register(),
        AppRoutes.forgetPasswordRouteName: (context) => ForgetPassword(),
        AppRoutes.resetPasswordRouteName: (context) => ResetPassword(),
        AppRoutes.updateProfileRouteName: (context) {
          final args = ModalRoute.of(context)!.settings.arguments as Map;

          return UpdateProfile(
            name: args['name'],
            phone: args['phone'],
            avatarIndex: args['avatarIndex'],
          );
        },
        AppRoutes.movieDetailsRouteName: (context) => MovieDetails(),
      },
      themeMode: ThemeMode.dark,
      theme: AppTheme.darkTheme,
    );
  }
}
