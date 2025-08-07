import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icons_plus/icons_plus.dart';

class CustomLoginWithGoogle extends StatelessWidget {
  const CustomLoginWithGoogle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 12.w,
      children: [
        Brand(Brands.google),
        Text(
          "login_with_google".tr(),
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ],
    );
  }
}
