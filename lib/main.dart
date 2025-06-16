import 'package:easy_localization/easy_localization.dart';
import 'package:evently/core/app_theme/theme.dart';
import 'package:evently/providers/theme_provider.dart';
import 'package:evently/providers/user_provider.dart';
import 'package:evently/screens/forget_password_screen/forget_password_screen.dart';
import 'package:evently/screens/home_screen/home_screen.dart';
import 'package:evently/screens/home_screen/taps/home_tap/create_event.dart';
import 'package:evently/screens/introduction_screen/introduction_screen.dart';
import 'package:evently/screens/login_screen/login_screen.dart';
import 'package:evently/screens/register_screen/register_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/app_theme/dark_theme.dart';
import 'core/app_theme/light_theme.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => UserProvider()),
      ],
      child: EasyLocalization(
        supportedLocales: [Locale('en'), Locale('ar')],
        path: 'assets/translations',
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
    var themeProvider = Provider.of<ThemeProvider>(context);
    var userProvider = Provider.of<UserProvider>(context);
    BaseTheme lightTheme = LightTheme();
    BaseTheme darkTheme = DarkTheme();
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: lightTheme.themeData,
      darkTheme: darkTheme.themeData,
      themeMode: themeProvider.themeMode,
      debugShowCheckedModeBanner: false,
      initialRoute:
          userProvider.firebaseUser != null
              ? HomeScreen.routeName
              : IntroductionScreen.routeName,
      routes: {
        IntroductionScreen.routeName: (context) => const IntroductionScreen(),
        RegisterScreen.routeName: (context) => RegisterScreen(),
        LoginScreen.routeName: (context) => LoginScreen(),
        ForgetPasswordScreen.routeName:
            (context) => const ForgetPasswordScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
        CreateEvent.routeName: (context) => CreateEvent(),
      },
    );
  }
}
