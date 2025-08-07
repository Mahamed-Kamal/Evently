import 'package:easy_localization/easy_localization.dart';
import 'package:evently/core/route_manager/routes.dart';
import 'package:evently/core/utils/dialog_utils.dart';
import 'package:evently/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class LogoutButton extends StatefulWidget {
  const LogoutButton({super.key});

  @override
  State<LogoutButton> createState() => _LogoutButtonState();
}

class _LogoutButtonState extends State<LogoutButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
      onPressed: () => logout(),
      child: Row(
        spacing: 6.w,
        children: [
          Icon(
            Icons.logout,
            color: Theme.of(context).textTheme.labelLarge!.color,
          ),
          Text("logout".tr(), style: Theme.of(context).textTheme.labelLarge),
        ],
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
        Navigator.pushReplacementNamed(context, Routes.loginScreen);
      },
      negActionTitle: "cancel".tr(),
    );
  }
}
