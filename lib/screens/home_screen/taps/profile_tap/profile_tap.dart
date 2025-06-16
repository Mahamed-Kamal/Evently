import 'package:easy_localization/easy_localization.dart';
import 'package:evently/App%20Utils/dialog_utils.dart';
import 'package:evently/providers/theme_provider.dart';
import 'package:evently/providers/user_provider.dart';
import 'package:evently/screens/home_screen/taps/profile_tap/theme_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../login_screen/login_screen.dart';
import 'language_bottom_sheet.dart';

class ProfileTap extends StatefulWidget {
  const ProfileTap({super.key});

  @override
  State<ProfileTap> createState() => _ProfileTapState();
}

class _ProfileTapState extends State<ProfileTap> {
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    var userProvider = Provider.of<UserProvider>(context);
    double heightSize = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        toolbarHeight: heightSize * 0.150,
        centerTitle: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              userProvider.userModel?.name ?? "",
              style: Theme.of(context).textTheme.labelLarge,
            ),
            Text(
              userProvider.userModel?.email ?? "",
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 12,
          children: [
            Text("language".tr(), style: Theme.of(context).textTheme.bodyLarge),
            InkWell(
              onTap: () {
                showBottomLanguage();
              },
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: Theme.of(context).primaryColor),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "nowLanguage".tr(),
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Icon(
                      Icons.arrow_drop_down,
                      color: Theme.of(context).primaryColor,
                    ),
                  ],
                ),
              ),
            ),
            Text("theme".tr(), style: Theme.of(context).textTheme.bodyLarge),
            InkWell(
              onTap: () {
                showBottomLanguageTheme();
              },
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: Theme.of(context).primaryColor),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      themeProvider.themeMode == ThemeMode.light
                          ? "light".tr()
                          : "dark".tr(),
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Icon(
                      Icons.arrow_drop_down,
                      color: Theme.of(context).primaryColor,
                    ),
                  ],
                ),
              ),
            ),
            Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () {
                logout();
              },
              child: Row(
                spacing: 6,
                children: [
                  Icon(
                    Icons.logout,
                    color: Theme.of(context).textTheme.labelLarge!.color,
                  ),
                  Text(
                    "logout".tr(),
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ],
              ),
            ),
            SizedBox(height: 18),
          ],
        ),
      ),
    );
  }

  void logout() {
    var authProvider = Provider.of<UserProvider>(context, listen: false);
    showMessageDialog(
      "please_confirm_logout".tr(),
      posActionTitle: "logout".tr(),
      posAction: () {
        authProvider.isLogout();
        Navigator.pushReplacementNamed(context, LoginScreen.routeName);
      },
      negActionTitle: "cancel".tr(),
    );
  }

  void showBottomLanguage() {
    showModalBottomSheet(
      context: context,
      builder: (context) => LanguageBottomSheet(),
    );
  }

  void showBottomLanguageTheme() {
    showModalBottomSheet(
      context: context,
      builder: (context) => ThemeBottomSheet(),
    );
  }
}
