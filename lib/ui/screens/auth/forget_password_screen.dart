import 'package:easy_localization/easy_localization.dart';
import 'package:evently/core/app_assets.dart';
import 'package:flutter/material.dart';

class ForgetPasswordScreen extends StatelessWidget {
  static const String routeName = "Forget-Password";

  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "forget_password".tr(),
          style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 20),
        ),
        iconTheme: IconThemeData(
          color: Theme.of(context).textTheme.bodySmall?.color,
        ),
      ),
      body: Padding(
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
    );
  }
}
