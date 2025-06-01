import 'package:easy_localization/easy_localization.dart';
import 'package:evently/core/app_assets.dart';
import 'package:evently/ui/widgets/language_switcher/language_switcher.dart';
import 'package:evently/ui/widgets/theme_switcher/theme_switcher.dart';
import 'package:flutter/material.dart';

import '../../../widgets/custom_already_have_account.dart';
import '../../../widgets/text_field_item.dart';

class RegisterScreen extends StatelessWidget {
  static const String routeName = "Register-Screen";

  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "register".tr(),
          style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 20),
        ),
        iconTheme: IconThemeData(
          color: Theme.of(context).textTheme.bodySmall?.color,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: 12,
            children: [
              Image.asset(
                AppAssets.eventlyHeader,
                alignment: Alignment.topCenter,
                height: size * .22,
              ),
              TextFieldItem(hintText: "name".tr(), icon: Icons.person),
              TextFieldItem(hintText: "email".tr(), icon: Icons.email),
              TextFieldItem(
                hintText: "password".tr(),
                icon: Icons.lock,
                isPassword: true,
              ),
              TextFieldItem(
                hintText: "rePassword".tr(),
                icon: Icons.lock,
                isPassword: true,
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  "create_account".tr(),
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
              CustomAlreadyHaveAccount(),
              Center(child: LanguageSwitcher()),
            ],
          ),
        ),
      ),
    );
  }
}
