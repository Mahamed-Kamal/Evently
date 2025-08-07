import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LoginText extends StatelessWidget {
  const LoginText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text("login".tr(), style: Theme.of(context).textTheme.labelLarge);
  }
}
