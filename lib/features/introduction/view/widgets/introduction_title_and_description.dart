import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IntroductionTitleAndDescription extends StatelessWidget {
  const IntroductionTitleAndDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          "introduction_title".tr(),
          style: Theme.of(context).textTheme.titleMedium,
          textAlign: TextAlign.start,
        ),
        SizedBox(height: 6.h),
        Text(
          "introduction_description".tr(),
          style: Theme.of(context).textTheme.bodySmall,
          textAlign: TextAlign.start,
        ),
        SizedBox(height: 14.h),
      ],
    );
  }
}
