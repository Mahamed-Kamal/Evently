import 'package:easy_localization/easy_localization.dart';
import 'package:evently/core/route_manager/routes.dart';
import 'package:flutter/material.dart';

class ForgetPasswordWidget extends StatelessWidget {
  const ForgetPasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed:
          () => Navigator.pushNamedAndRemoveUntil(
            context,
            Routes.forgetPasswordScreen,
            (route) => false,
          ),
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
    );
  }
}
