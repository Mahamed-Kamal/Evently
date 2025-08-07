import 'package:easy_localization/easy_localization.dart';
import 'package:evently/core/route_manager/routes.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoNotHaveAccountAndCreateAccount extends StatelessWidget {
  const DoNotHaveAccountAndCreateAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: "don't_have_account".tr(),
            style: Theme.of(context).textTheme.bodySmall,
          ),
          WidgetSpan(child: SizedBox(width: 12.w)),
          TextSpan(
            text: "create_account".tr(),
            style: Theme.of(context).textTheme.titleSmall,
            recognizer:
                TapGestureRecognizer()
                  ..onTap =
                      () => Navigator.pushNamedAndRemoveUntil(
                        context,
                        Routes.registerScreen,
                        (route) => false,
                      ),
          ),
        ],
      ),
    );
  }
}
