import 'package:evently/features/main_layout/taps/profile_tap/view/widgets/custom_app_bar_profile.dart';
import 'package:evently/features/main_layout/taps/profile_tap/view/widgets/language_widgets/language_text_and_widget.dart';
import 'package:evently/features/main_layout/taps/profile_tap/view/widgets/logout_button.dart';
import 'package:evently/features/main_layout/taps/profile_tap/view/widgets/theming_widgets/theme_text_and_widget.dart';
import 'package:evently/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ProfileTap extends StatelessWidget {
  const ProfileTap({super.key});

  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: CustomAppBarProfile(
        name: userProvider.userModel?.name ?? "",
        email: userProvider.userModel?.email ?? "",
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Column(
          spacing: 12.h,
          children: [
            const LanguageTextAndWidget(),
            const ThemeTextAndWidget(),
            const Spacer(),
            const LogoutButton(),
            SizedBox(height: 18.h),
          ],
        ),
      ),
    );
  }
}
