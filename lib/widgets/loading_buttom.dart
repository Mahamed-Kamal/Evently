import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LoadingButtom extends StatelessWidget {
  const LoadingButtom({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 12,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircularProgressIndicator(color: Theme.of(context).primaryColor),
        Text(
          "loading...".tr(),
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
            color: Theme.of(context).primaryColor,
          ),
        ),
      ],
    );
  }
}
