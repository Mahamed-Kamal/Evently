import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../data/models/event_category_model.dart';

class CategoryEventItem extends StatelessWidget {
  final bool isSelected;
  final EventCategoryModel eventCategoryModel;

  const CategoryEventItem({
    super.key,
    required this.eventCategoryModel,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).primaryColor),
        borderRadius: BorderRadius.all(Radius.circular(38.r)),
        color: isSelected ? Theme.of(context).primaryColor : Colors.transparent,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        spacing: 6.w,
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
