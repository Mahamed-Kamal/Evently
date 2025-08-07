import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

typedef FunctionOnTap = void Function()?;

class ChooseItem extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final String textButton;
  final FunctionOnTap onTap;

  const ChooseItem({
    super.key,
    required this.hintText,
    required this.textButton,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8.w,
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
