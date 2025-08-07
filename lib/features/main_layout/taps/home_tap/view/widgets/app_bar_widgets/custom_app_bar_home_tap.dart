import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'build_actions.dart';
import 'build_title.dart';

class CustomAppBarHomeTap extends StatelessWidget
    implements PreferredSizeWidget {
  final Widget child;

  const CustomAppBarHomeTap({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shape: _shapeStyle(),
      centerTitle: false,
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      toolbarHeight: 140.h,
      title: BuildTitle(),
      actions: [BuildActions()],
      bottom: AppBar(
        toolbarHeight: 90.h,
        shape: _shapeStyle(),
        centerTitle: false,
        backgroundColor: Theme.of(context).secondaryHeaderColor,
        title: Container(
          height: 50.h,
          margin: EdgeInsets.only(bottom: 10.h),
          child: child,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size(0, 180.h);

  RoundedRectangleBorder _shapeStyle() {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        bottomRight: Radius.circular(24.r),
        bottomLeft: Radius.circular(24.r),
      ),
    );
  }
}
