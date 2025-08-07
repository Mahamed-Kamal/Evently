import 'package:easy_localization/easy_localization.dart';
import 'package:evently/core/route_manager/routes.dart';
import 'package:flutter/material.dart';

class CustomAlreadyHaveAccount extends StatelessWidget {
  const CustomAlreadyHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "already_have_account".tr(),
          style: Theme.of(context).textTheme.bodySmall,
        ),
        TextButton(
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
                context, Routes.loginScreen, (route) => false);
          },
          child: Text(
            "login".tr(),
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}
