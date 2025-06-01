import 'package:easy_localization/easy_localization.dart';
import 'package:evently/ui/widgets/language_switcher/language_switcher.dart';
import 'package:flutter/material.dart';

import '../../../../core/app_assets.dart';

import '../../../widgets/custom_login_with_google/custom_login_with_google.dart';
import '../../../widgets/divider_or_item.dart';
import '../../../widgets/text_field_item.dart';
import '../forget_password_screen.dart';
import '../register_screen/register_screen.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = "Login-Screen";

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              spacing: 12,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  AppAssets.eventlyHeader,
                  alignment: Alignment.topCenter,
                  height: size * .22,
                ),
                TextFieldItem(hintText: "email".tr(), icon: Icons.email),
                TextFieldItem(
                  hintText: "password".tr(),
                  isPassword: true,
                  icon: Icons.lock,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      ForgetPasswordScreen.routeName,
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "forget_password?".tr(),
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "login".tr(),
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "don't_have_account".tr(),
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, RegisterScreen.routeName);
                      },
                      child: Text(
                        "create_account".tr(),
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                  ],
                ),
                DividerOrItem(),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    side: BorderSide(color: Theme.of(context).primaryColor),
                  ),
                  onPressed: () {},
                  child: CustomLoginWithGoogle(),
                ),
                Center(child: LanguageSwitcher()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
