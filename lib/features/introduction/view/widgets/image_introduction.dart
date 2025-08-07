import 'package:evently/core/app_assets.dart';
import 'package:flutter/material.dart';

class ImageIntroduction extends StatelessWidget {
  const ImageIntroduction({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppAssets.introductionImage,
      width: double.infinity,
      fit: BoxFit.cover,
    );
  }
}
