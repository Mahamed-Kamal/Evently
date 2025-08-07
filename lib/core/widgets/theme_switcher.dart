import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';
import '../../../providers/theme_provider.dart';

class ThemeSwitcher extends StatelessWidget {
  const ThemeSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeProvider>(context);
    return AnimatedToggleSwitch<ThemeMode>.rolling(
      current: provider.themeMode,
      style: ToggleStyle(
        backgroundColor: Colors.transparent,
        indicatorColor: Theme.of(context).primaryColor,
        borderColor: Theme.of(context).primaryColor,
      ),
      values: const [ThemeMode.light, ThemeMode.dark],
      onChanged: (newLocal) {
        provider.changeTheme(newLocal);
      },

      iconBuilder: (value, foreground) {
        if (value == ThemeMode.light) {
          return const Icon(EvaIcons.sun);
        } else {
          return const Icon(EvaIcons.moon_outline);
        }
      },
    );
  }
}
