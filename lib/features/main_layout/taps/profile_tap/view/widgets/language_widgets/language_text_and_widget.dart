import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'language_bottom_sheet.dart';

class LanguageTextAndWidget extends StatelessWidget {
  const LanguageTextAndWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: 12.h,
      children: [
        Text("language".tr(), style: Theme.of(context).textTheme.bodyLarge),
        InkWell(
          onTap: () => showBottomLanguage(context),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
            decoration: BoxDecoration(
              border: Border.all(color: Theme.of(context).primaryColor),
              borderRadius: BorderRadius.circular(16.r),
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
      ],
    );
  }

  void showBottomLanguage(context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => LanguageBottomSheet(),
    );
  }
}
