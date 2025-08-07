import 'package:easy_localization/easy_localization.dart';
import 'package:evently/core/route_manager/routes.dart';
import 'package:flutter/material.dart';

class AppBarItem extends StatelessWidget implements PreferredSizeWidget {
  const AppBarItem({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          Navigator.pushNamedAndRemoveUntil(
            context,
            Routes.loginScreen,
            (route) => false,
          );
        },
        icon: const Icon(Icons.arrow_back),
      ),
      title: titleWidget(context),
      iconTheme: IconThemeData(
        color: Theme.of(context).textTheme.bodySmall?.color,
      ),
    );
  }

  @override
  //ToDo : Refactor this Mohamed Kamal
  Size get preferredSize => Size(0, 130);

  Widget titleWidget(context) {
    return Text(
      "forget_password".tr(),
      style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 20),
    );
  }
}
