import 'package:evently/core/app_assets.dart';
import 'package:evently/features/introduction/view/widgets/image_introduction.dart';
import 'package:evently/features/introduction/view/widgets/language_text_and_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'widgets/introduction_title_and_description.dart';
import 'widgets/lets_start_button.dart';
import 'widgets/theme_text_and_switcher.dart';

class IntroductionScreen extends StatelessWidget {
  const IntroductionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Image.asset(AppAssets.logoHeader)),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const ImageIntroduction(),
                const IntroductionTitleAndDescription(),
                const LanguageTextAndSwitcher(),
                SizedBox(height: 14.h),
                const ThemeTextAndSwitcher(),
                SizedBox(height: 22.h),
                const LetsStartButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
