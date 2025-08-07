import 'package:easy_localization/easy_localization.dart';
import 'package:evently/features/main_layout/taps/profile_tap/view/widgets/theming_widgets/theme_bottom_sheet.dart';
import 'package:evently/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ThemeTextAndWidget extends StatelessWidget {
  const ThemeTextAndWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: 12.h,
      children: [
        Text("theme".tr(), style: Theme.of(context).textTheme.bodyLarge),
        InkWell(
          onTap: () => showBottomTheme(context),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            decoration: BoxDecoration(
              border: Border.all(color: Theme.of(context).primaryColor),
              borderRadius: BorderRadius.circular(16.r),
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
      ],
    );
  }

  void showBottomTheme(context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => ThemeBottomSheet(),
    );
  }
}
