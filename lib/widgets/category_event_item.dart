import 'package:flutter/material.dart';
import '../models/event_category_model.dart';

class CategoryEventItem extends StatelessWidget {
  bool isSelected;
  EventCategoryModel eventCategoryModel;

  CategoryEventItem({
    super.key,
    required this.eventCategoryModel,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).primaryColor),
        borderRadius: const BorderRadius.all(Radius.circular(38)),
        color: isSelected ? Theme.of(context).primaryColor : Colors.transparent,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        spacing: 6,
        children: [
          Icon(
            eventCategoryModel.icon,
            color: isSelected ? Colors.white : Theme.of(context).primaryColor,
          ),
          Text(
            eventCategoryModel.name,
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
              color: isSelected ? Colors.white : Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
