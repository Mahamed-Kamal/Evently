import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/data/models/task_model.dart';
import 'package:evently/features/main_layout/taps/home_tap/view/widgets/app_bar_widgets/category_app_bar_item.dart';
import 'package:evently/features/main_layout/taps/home_tap/view/widgets/app_bar_widgets/custom_app_bar_home_tap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../../create_event/create_event_provider.dart';
import '../../../../../core/firebase/firebase_manager.dart';
import '../../../../../core/widgets/event_item.dart';

class HomeTap extends StatelessWidget {
  const HomeTap({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CreateEventProvider(),
      builder: (context, child) {
        var provider = Provider.of<CreateEventProvider>(context);
        return Scaffold(
          appBar: CustomAppBarHomeTap(
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder:
                  (context, index) => InkWell(
                    onTap: () => provider.changeCategory(index),
                    child: CategoryAppBarItem(
                      eventCategoryModel: provider.eventCategoriesTap[index],
                      isSelected: provider.selectedCategory == index,
                    ),
                  ),
              separatorBuilder: (context, index) => SizedBox(width: 12.w),
              itemCount: provider.eventCategoriesTap.length,
            ),
          ),
          body: StreamBuilder<QuerySnapshot<TaskModel>>(
            stream: FirebaseManager.getTask(
              provider.eventCategoriesTap[provider.selectedCategory].name,
            ),
            builder: (context, snapshot) {
              return ListView.builder(
                itemCount: snapshot.data?.docs.length ?? 0,
                itemBuilder:
                    (context, index) =>
                        EventItem(model: snapshot.data!.docs[index].data()),
              );
            },
          ),
        );
      },
    );
  }
}
