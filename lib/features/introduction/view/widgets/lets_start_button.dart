import 'package:easy_localization/easy_localization.dart';
import 'package:evently/core/route_manager/routes.dart';
import 'package:flutter/material.dart';

class LetsStartButton extends StatelessWidget {
  const LetsStartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushReplacementNamed(context, Routes.loginScreen);
      },
      child: Text(
        "lets_start".tr(),
        style: Theme.of(
          context,
        ).textTheme.titleMedium!.copyWith(color: Colors.white),
      ),
    );
  }
}
