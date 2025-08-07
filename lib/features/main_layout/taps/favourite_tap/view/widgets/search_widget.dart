import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: TextField(
        cursorColor: Theme.of(context).primaryColor,
        style: Theme.of(context).textTheme.bodySmall,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.search_outlined,
            color: Theme.of(context).primaryColor,
          ),
          hintText: "search_for_event".tr(),
          hintStyle: Theme.of(context).textTheme.titleSmall,
          border: _styleBorder(context),
          enabledBorder: _styleBorder(context),
          focusedBorder: _styleBorder(context),
        ),
      ),
    );
  }

  OutlineInputBorder _styleBorder(BuildContext context) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: Theme.of(context).primaryColor),
      borderRadius: const BorderRadius.all(Radius.circular(16)),
    );
  }
}
