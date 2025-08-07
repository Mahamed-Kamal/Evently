import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CreateAccountText extends StatelessWidget {
  const CreateAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "create_account".tr(),
      style: Theme.of(context).textTheme.labelLarge,
    );
  }
}
