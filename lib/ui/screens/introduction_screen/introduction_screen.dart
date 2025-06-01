import 'package:easy_localization/easy_localization.dart';
import 'package:evently/core/app_assets.dart';
import 'package:flutter/material.dart';

import '../../widgets/language_switcher/language_switcher.dart';
import '../../widgets/theme_switcher/theme_switcher.dart';
import '../auth/login_screen/login_screen.dart';

class IntroductionScreen extends StatelessWidget {
  static const String routeName = "Introduction-Screen";

  const IntroductionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Image.asset(AppAssets.logoHeader)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          spacing: 6,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              AppAssets.introductionImage,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Text(
              "introduction_title".tr(),
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.start,
            ),
            Text(
              "introduction_description".tr(),
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.start,
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "language".tr(),
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                LanguageSwitcher(),
              ],
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "theme".tr(),
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                ThemeSwitcher(),
              ],
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, LoginScreen.routeName);
              },
              child: Text(
                "lets_start".tr(),
                style: Theme.of(
                  context,
                ).textTheme.titleMedium!.copyWith(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
