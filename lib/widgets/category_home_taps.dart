import 'package:flutter/material.dart';
import '../models/event_category_model.dart';

class CategoryHomeTaps extends StatelessWidget {
  bool isSelected;
  EventCategoryModel eventCategoryModel;

  CategoryHomeTaps({
    super.key,
    required this.eventCategoryModel,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.all(Radius.circular(38)),
        color: isSelected ? Colors.white : Colors.transparent,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        spacing: 6,
        children: [
          Icon(
            eventCategoryModel.icon,
            color: isSelected ? Theme.of(context).primaryColor : Colors.white,
          ),
          Text(
            eventCategoryModel.name,
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
              color: isSelected ? Theme.of(context).primaryColor : Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
