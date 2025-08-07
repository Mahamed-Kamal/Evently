import 'package:easy_localization/easy_localization.dart';
import 'package:evently/core/route_manager/route_generator.dart';
import 'package:evently/core/route_manager/routes.dart';
import 'package:evently/providers/theme_provider.dart';
import 'package:evently/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'core/app_theme/dark_theme.dart';
import 'core/app_theme/light_theme.dart';
import 'core/app_theme/theme.dart';

class EventlyApp extends StatelessWidget {
  const EventlyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    var userProvider = Provider.of<UserProvider>(context);
    BaseTheme lightTheme = LightTheme();
    BaseTheme darkTheme = DarkTheme();
    return ScreenUtilInit(
      designSize: const Size(393, 841),
      minTextAdapt: true,
      splitScreenMode: true,
      builder:
          (context, child) => MaterialApp(
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            theme: lightTheme.themeData,
            darkTheme: darkTheme.themeData,
            themeMode: themeProvider.themeMode,
            debugShowCheckedModeBanner: false,
            initialRoute:
                userProvider.firebaseUser != null
                    ? Routes.mainLayout
                    : Routes.introductionScreen,
            onGenerateRoute: RouteGenerator.getRoute,
          ),
    );
  }
}
