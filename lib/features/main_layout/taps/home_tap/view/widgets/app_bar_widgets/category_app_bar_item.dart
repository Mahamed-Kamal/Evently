import 'package:evently/data/models/event_category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryAppBarItem extends StatelessWidget {
  final bool isSelected;
  final EventCategoryModel eventCategoryModel;

  const CategoryAppBarItem({
    super.key,
    required this.eventCategoryModel,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.all(Radius.circular(38.r)),
        color: isSelected ? Colors.white : Colors.transparent,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        spacing: 6.w,
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
