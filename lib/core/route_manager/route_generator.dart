import 'package:evently/core/route_manager/routes.dart';
import 'package:evently/features/create_event/view/screens/create_event_screen.dart';
import 'package:evently/features/forget_password/view/screens/forget_password_screen.dart';
import 'package:evently/features/login/view/login_view.dart';
import 'package:evently/features/main_layout/view/main_layout_view.dart';
import 'package:evently/features/register/view/register_view.dart';
import 'package:flutter/material.dart';
import '../../features/introduction/view/introduction_view.dart';

class RouteGenerator {
  static Route<dynamic>? getRoute(RouteSettings setting) {
    switch (setting.name) {
      case Routes.introductionScreen:
        return MaterialPageRoute(builder: (_) => const IntroductionScreen());
      case Routes.registerScreen:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.forgetPasswordScreen:
        return MaterialPageRoute(builder: (_) => const ForgetPasswordScreen());
      case Routes.mainLayout:
        return MaterialPageRoute(builder: (_) => const MainLayoutView());
      case Routes.createEvent:
        return MaterialPageRoute(builder: (_) => const CreateEvent());
      default:
        return null;
    }
  }
}
