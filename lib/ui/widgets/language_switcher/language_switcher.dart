import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class LanguageSwitcher extends StatefulWidget {
  const LanguageSwitcher({super.key});

  @override
  State<LanguageSwitcher> createState() => _LanguageSwitcherState();
}

class _LanguageSwitcherState extends State<LanguageSwitcher> {
  late var selectedLocal = "en";

  @override
  Widget build(BuildContext context) {
    selectedLocal = context.locale.languageCode;
    return AnimatedToggleSwitch<String>.rolling(
      current: selectedLocal,
      style: ToggleStyle(
        backgroundColor: Colors.transparent,
        indicatorColor: Theme.of(context).primaryColor,
        borderColor: Theme.of(context).primaryColor,
      ),
      values: const ["en", "ar"],
      onChanged: (newLocal) {
        newLocal == "en"
            ? context.setLocale(Locale('en'))
            : context.setLocale(Locale('ar'));
        selectedLocal = newLocal;

        setState(() {});
      },
      iconBuilder: (value, foreground) {
        if (value == "en") {
          return Flag(Flags.united_states_of_america);
        } else {
          return Flag(Flags.egypt);
        }
      },
    );
  }
}
