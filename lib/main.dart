import 'package:easy_localization/easy_localization.dart';
import 'package:evently/core/app_theme/theme.dart';
import 'package:evently/providers/my_provider.dart';
import 'package:evently/ui/screens/auth/forget_password_screen.dart';
import 'package:evently/ui/screens/auth/login_screen/login_screen.dart';
import 'package:evently/ui/screens/auth/register_screen/register_screen.dart';
import 'package:evently/ui/screens/introduction_screen/introduction_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/app_theme/dark_theme.dart';
import 'core/app_theme/light_theme.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    ChangeNotifierProvider(
      create: (context) => MyProvider(),
      child: EasyLocalization(
        supportedLocales: [Locale('en'), Locale('ar')],
        path: 'assets/translations',
        // <-- change the path of the translation files
        fallbackLocale: Locale('en'),
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    BaseTheme lightTheme = LightTheme();
    BaseTheme darkTheme = DarkTheme();
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: lightTheme.themeData,
      darkTheme: darkTheme.themeData,
      themeMode: provider.themeMode,
      debugShowCheckedModeBanner: false,
      initialRoute: IntroductionScreen.routeName,
      routes: {
        IntroductionScreen.routeName: (context) => IntroductionScreen(),
        RegisterScreen.routeName: (context) => RegisterScreen(),
        LoginScreen.routeName: (context) => LoginScreen(),
        ForgetPasswordScreen.routeName: (context) => ForgetPasswordScreen(),
      },
    );
  }
}
