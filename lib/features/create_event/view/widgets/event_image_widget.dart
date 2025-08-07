import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EventImageWidget extends StatelessWidget {
  final String image;

  const EventImageWidget({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(16.r)),
      child: Image.asset(
        image,
        height: 200.h,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}
