import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DividerOrItem extends StatelessWidget {
  const DividerOrItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider()),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: Text("or".tr(), style: Theme.of(context).textTheme.titleSmall),
        ),
        const Expanded(child: Divider()),
      ],
    );
  }
}
