import 'package:evently/core/app_assets.dart';
import 'package:flutter/material.dart';

class ImageEventlyHeader extends StatelessWidget {
  const ImageEventlyHeader({super.key});

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.height;
    return Image.asset(
      AppAssets.eventlyHeader,
      alignment: Alignment.topCenter,
      height: size * .22,
    );
  }
}
