import 'package:easy_localization/easy_localization.dart';
import 'package:evently/core/widgets/theme_switcher.dart';
import 'package:flutter/material.dart';

class ThemeTextAndSwitcher extends StatelessWidget {
  const ThemeTextAndSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "theme".tr(),
          style: Theme.of(
            context,
          ).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w500),
        ),
        const ThemeSwitcher(),
      ],
    );
  }
}
