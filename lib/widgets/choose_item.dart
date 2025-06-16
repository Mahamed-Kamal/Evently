import 'package:flutter/material.dart';

typedef FunctionOnTap = void Function()?;

class ChooseItem extends StatelessWidget {
  String hintText;
  IconData icon;
  String textButton;
  FunctionOnTap onTap;

  ChooseItem({
    super.key,
    required this.hintText,
    required this.textButton,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        Icon(icon, color: Theme.of(context).textTheme.bodySmall!.color),
        Text(hintText, style: Theme.of(context).textTheme.bodySmall),
        Spacer(),
        InkWell(
          onTap: onTap,
          child: Text(
            textButton,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
      ],
    );
  }
}
