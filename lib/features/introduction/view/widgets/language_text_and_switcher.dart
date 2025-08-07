import 'package:easy_localization/easy_localization.dart';
import 'package:evently/core/widgets/language_switcher.dart';
import 'package:flutter/material.dart';

class LanguageTextAndSwitcher extends StatelessWidget {
  const LanguageTextAndSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "language".tr(),
          style: Theme.of(
            context,
          ).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w500),
        ),
        const LanguageSwitcher(),
      ],
    );
  }
}
