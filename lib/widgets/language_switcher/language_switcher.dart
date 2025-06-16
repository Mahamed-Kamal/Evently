import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class LanguageSwitcher extends StatelessWidget {
  const LanguageSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    var selectedLanguage = context.locale.languageCode;
    return AnimatedToggleSwitch<String>.rolling(
      current: selectedLanguage,
      style: ToggleStyle(
        backgroundColor: Colors.transparent,
        indicatorColor: Theme.of(context).primaryColor,
        borderColor: Theme.of(context).primaryColor,
      ),
      values: const ["en", "ar"],
      onChanged: (newLocal) {
        selectedLanguage == newLocal;
        context.setLocale(Locale(newLocal));
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
