import 'package:evently/screens/home_screen/taps/home_tap/create_event.dart';
import 'package:evently/screens/home_screen/taps/home_tap/home_tap.dart';
import 'package:evently/screens/home_screen/taps/favourite_tap/favourite_tap.dart';
import 'package:evently/screens/home_screen/taps/map_tap.dart';
import 'package:evently/screens/home_screen/taps/profile_tap/profile_tap.dart';
import 'package:flutter/material.dart';

import '../../widgets/bottom_nav_bar_item/bottom_nav_bar_item.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "Home-Screen";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<Widget> taps = [HomeTap(), MapTap(), FavouriteTap(), ProfileTap()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, CreateEvent.routeName);
        },
        child: const Icon(Icons.add, color: Colors.white, size: 30),
      ),
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
