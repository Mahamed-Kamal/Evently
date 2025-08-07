import 'package:easy_localization/easy_localization.dart';
import 'package:evently/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ThemeBottomSheet extends StatelessWidget {
  const ThemeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeProvider>(context);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
      child: Column(
        children: [
          InkWell(
            onTap: () => provider.changeTheme(ThemeMode.light),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "light".tr(),
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color:
                        provider.themeMode == ThemeMode.light
                            ? Theme.of(context).primaryColor
                            : Colors.black,
                  ),
                ),
                provider.themeMode == ThemeMode.light
                    ? Icon(Icons.check, color: Theme.of(context).primaryColor)
                    : SizedBox.shrink(),
              ],
            ),
          ),
          SizedBox(height: 18.h),
          InkWell(
            onTap: () => provider.changeTheme(ThemeMode.dark),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "dark".tr(),
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color:
                        provider.themeMode == ThemeMode.dark
                            ? Theme.of(context).primaryColor
                            : Colors.black,
                  ),
                ),
                provider.themeMode == ThemeMode.dark
                    ? Icon(Icons.check, color: Theme.of(context).primaryColor)
                    : SizedBox.shrink(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
