import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../core/app_assets.dart';
import '../models/event_category_model.dart';

class CreateEventProvider extends ChangeNotifier {
  List<EventCategoryModel> eventCategories = [
    EventCategoryModel(
      name: "birthday".tr(),
      imagePath: AppAssets.birthday,
      icon: Icons.cake,
    ),
    EventCategoryModel(
      name: "book_club".tr(),
      imagePath: AppAssets.bookclub,
      icon: CupertinoIcons.book_fill,
    ),
    EventCategoryModel(
      name: "eating".tr(),
      imagePath: AppAssets.eating,
      icon: Icons.restaurant_menu_sharp,
    ),
    EventCategoryModel(
      name: "exhibition".tr(),
      imagePath: AppAssets.exhibition,
      icon: Icons.landslide,
    ),
    EventCategoryModel(
      name: "gaming".tr(),
      imagePath: AppAssets.gaming,
      icon: CupertinoIcons.game_controller,
    ),
    EventCategoryModel(
      name: "holiday".tr(),
      imagePath: AppAssets.holiday,
      icon: Icons.family_restroom,
    ),
    EventCategoryModel(
      name: "meeting".tr(),
      imagePath: AppAssets.meeting,
      icon: Icons.handshake_outlined,
    ),
    EventCategoryModel(
      name: "sport".tr(),
      imagePath: AppAssets.sport,
      icon: Icons.directions_bike,
    ),
    EventCategoryModel(
      name: "work_shop".tr(),
      imagePath: AppAssets.workshop,
      icon: Icons.work_outline,
    ),
  ];
  List<EventCategoryModel> eventCategoriesTap = [
    EventCategoryModel(
      name: "all".tr(),
      imagePath: "",
      icon: CupertinoIcons.compass,
    ),
    EventCategoryModel(
      name: "birthday".tr(),
      imagePath: AppAssets.birthday,
      icon: Icons.cake,
    ),
    EventCategoryModel(
      name: "book_club".tr(),
      imagePath: AppAssets.bookclub,
      icon: CupertinoIcons.book_fill,
    ),
    EventCategoryModel(
      name: "eating".tr(),
      imagePath: AppAssets.eating,
      icon: Icons.restaurant_menu_sharp,
    ),
    EventCategoryModel(
      name: "exhibition".tr(),
      imagePath: AppAssets.exhibition,
      icon: Icons.landslide,
    ),
    EventCategoryModel(
      name: "gaming".tr(),
      imagePath: AppAssets.gaming,
      icon: CupertinoIcons.game_controller,
    ),
    EventCategoryModel(
      name: "holiday".tr(),
      imagePath: AppAssets.holiday,
      icon: Icons.family_restroom,
    ),
    EventCategoryModel(
      name: "meeting".tr(),
      imagePath: AppAssets.meeting,
      icon: Icons.handshake_outlined,
    ),
    EventCategoryModel(
      name: "sport".tr(),
      imagePath: AppAssets.sport,
      icon: Icons.directions_bike,
    ),
    EventCategoryModel(
      name: "work_shop".tr(),
      imagePath: AppAssets.workshop,
      icon: Icons.work_outline,
    ),
  ];

  int selectedCategory = 0;

  changeCategory(int index) {
    selectedCategory = index;
    notifyListeners();
  }
}
