import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var selectedLanguage = context.locale.languageCode;

    double heightSize = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            onTap: () {
              context.setLocale(Locale("en"));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "english".tr(),
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color:
                        selectedLanguage == "en"
                            ? Theme.of(context).primaryColor
                            : Colors.black,
                  ),
                ),
                selectedLanguage == "en"
                    ? Icon(Icons.check, color: Theme.of(context).primaryColor)
                    : SizedBox(),
              ],
            ),
          ),
          SizedBox(height: heightSize * 0.02),
          InkWell(
            onTap: () {
              context.setLocale(Locale("ar"));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "arabic".tr(),
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color:
                        selectedLanguage == "ar"
                            ? Theme.of(context).primaryColor
                            : Colors.black,
                  ),
                ),
                selectedLanguage == "ar"
                    ? Icon(Icons.check, color: Theme.of(context).primaryColor)
                    : SizedBox(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
