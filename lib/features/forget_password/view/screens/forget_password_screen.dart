import 'package:easy_localization/easy_localization.dart';
import 'package:evently/core/app_assets.dart';
import 'package:evently/features/forget_password/view/widgets/app_bar_item.dart';
import 'package:flutter/material.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: const AppBarItem(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                AppAssets.forgetImage,
                width: double.infinity,
                height: size * .44,
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  "reset_password".tr(),
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
