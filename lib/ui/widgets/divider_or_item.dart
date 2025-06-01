import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class DividerOrItem extends StatelessWidget {
  const DividerOrItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider()),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text("or".tr(), style: Theme.of(context).textTheme.titleSmall),
        ),
        Expanded(child: Divider()),
      ],
    );
  }
}
