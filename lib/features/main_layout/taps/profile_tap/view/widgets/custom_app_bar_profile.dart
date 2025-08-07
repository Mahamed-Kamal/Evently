import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBarProfile extends StatelessWidget
    implements PreferredSizeWidget {
  final String name;
  final String email;

  const CustomAppBarProfile({
    super.key,
    required this.name,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).primaryColor,
      toolbarHeight: 110.h,
      centerTitle: false,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name, style: Theme.of(context).textTheme.labelLarge),
          Text(email, style: Theme.of(context).textTheme.labelLarge),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size(0, 120.h);
}
