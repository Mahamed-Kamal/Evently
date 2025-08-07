import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildActions extends StatelessWidget {
  const BuildActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.wb_sunny_outlined,
            color: Colors.white,
            size: 40.h,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 16.w),
          child: IconButton(
            style: IconButton.styleFrom(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
            onPressed: () {},
            icon: Text(
              "en".tr(),
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                color: Theme.of(context).secondaryHeaderColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
