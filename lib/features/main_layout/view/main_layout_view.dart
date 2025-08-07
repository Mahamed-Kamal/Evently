import 'package:evently/features/main_layout/taps/favourite_tap/view/favourite_tap_view.dart';
import 'package:evently/features/main_layout/taps/home_tap/view/home_tap_view.dart';
import 'package:evently/features/main_layout/taps/map_tap/map_tap_view.dart';
import 'package:evently/features/main_layout/taps/profile_tap/view/profile_tap_view.dart';
import 'package:evently/features/main_layout/view/widgets/custom_floating_action_button_widget.dart';
import 'package:flutter/material.dart';
import 'widgets/bottom_nav_bar_item.dart';

class MainLayoutView extends StatefulWidget {
  const MainLayoutView({super.key});

  @override
  State<MainLayoutView> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<MainLayoutView> {
  int currentIndex = 0;

  List<Widget> taps = [
    const HomeTap(),
    const MapTap(),
    const FavouriteTap(),
    const ProfileTap(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      resizeToAvoidBottomInset: false,
      floatingActionButton: CustomFloatingActionButtonWidget(),
      bottomNavigationBar: BottomNavBarItem(
        onChange: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
      body: taps[currentIndex],
    );
  }
}
