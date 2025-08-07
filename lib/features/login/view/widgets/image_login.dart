import 'package:evently/core/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageLogin extends StatelessWidget {
  const ImageLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppAssets.eventlyHeader,
      alignment: Alignment.topCenter,
      height: 186.h,
    );
  }
}
