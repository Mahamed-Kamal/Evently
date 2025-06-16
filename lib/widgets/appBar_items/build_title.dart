import 'package:easy_localization/easy_localization.dart';
import 'package:evently/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BuildTitle extends StatelessWidget {
  const BuildTitle({super.key});

  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context);
    return Column(
      spacing: 6,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "welcome_back".tr(),
          style: Theme.of(context).textTheme.labelLarge!.copyWith(fontSize: 14),
        ),
        Text(
          userProvider.userModel?.name ?? "",
          style: Theme.of(context).textTheme.labelLarge!.copyWith(fontSize: 24),
        ),
        Row(
          children: [
            Icon(Icons.location_on_outlined, color: Colors.white),
            Text(
              "cairo_egypt".tr(),
              style: Theme.of(
                context,
              ).textTheme.labelLarge!.copyWith(fontSize: 14),
            ),
          ],
        ),
      ],
    );
  }
}
