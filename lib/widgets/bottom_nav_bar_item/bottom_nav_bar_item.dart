import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavBarItem extends StatefulWidget {
  Function onChange;

  BottomNavBarItem({super.key, required this.onChange});

  @override
  State<BottomNavBarItem> createState() => _BottomNavBarItemState();
}

class _BottomNavBarItemState extends State<BottomNavBarItem> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) {
        setState(() {
          currentIndex = index;
          widget.onChange(currentIndex);
        });
      },
      items: [
        BottomNavigationBarItem(
          icon:
              currentIndex == 0
                  ? const Icon(CupertinoIcons.house_fill)
                  : const Icon(CupertinoIcons.home),
          label: "home".tr(),
        ),
        BottomNavigationBarItem(
          icon:
              currentIndex == 1
                  ? const Icon(Icons.location_on)
                  : const Icon(Icons.location_on_outlined),
          label: "map".tr(),
        ),
        BottomNavigationBarItem(
          icon:
              currentIndex == 2
                  ? const Icon(CupertinoIcons.heart_fill)
                  : const Icon(CupertinoIcons.heart),
          label: "favourite".tr(),
        ),
        BottomNavigationBarItem(
          icon:
              currentIndex == 3
                  ? const Icon(CupertinoIcons.person_fill)
                  : const Icon(CupertinoIcons.person),
          label: "profile".tr(),
        ),
      ],
    );
  }
}
