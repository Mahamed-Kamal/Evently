import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class BuildActions extends StatelessWidget {
  const BuildActions({super.key});

  @override
  Widget build(BuildContext context) {
    double heightSize = MediaQuery.of(context).size.height;
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.wb_sunny_outlined,
            color: Colors.white,
            size: heightSize * .045,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: IconButton(
            style: IconButton.styleFrom(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
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
