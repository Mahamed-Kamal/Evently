import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:evently/firebase/firebase_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../providers/create_event_provider.dart';
import '../../../../models/task_model.dart';
import '../../../../widgets/appBar_items/build_actions.dart';
import '../../../../widgets/appBar_items/build_title.dart';
import '../../../../widgets/category_home_taps.dart';
import '../../../../widgets/event_item.dart';

class HomeTap extends StatelessWidget {
  const HomeTap({super.key});

  @override
  Widget build(BuildContext context) {
    double heightSize = MediaQuery.of(context).size.height;
    return ChangeNotifierProvider(
      create: (context) => CreateEventProvider(),
      builder: (context, child) {
        var provider = Provider.of<CreateEventProvider>(context);
        return Scaffold(
          appBar: AppBar(
            shape: _shapeStyle(),
            centerTitle: false,
            backgroundColor: Theme.of(context).secondaryHeaderColor,
            toolbarHeight: heightSize * .14,
            title: BuildTitle(),
            actions: [BuildActions()],
            bottom: AppBar(
              toolbarHeight: heightSize * .09,
              shape: _shapeStyle(),
              centerTitle: false,
              backgroundColor: Theme.of(context).secondaryHeaderColor,
              title: Container(
                height: heightSize * 0.06,
                margin: EdgeInsets.only(bottom: 10),
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder:
                      (context, index) => InkWell(
                        onTap: () {
                          provider.changeCategory(index);
                        },
                        child: CategoryHomeTaps(
                          eventCategoryModel:
                              provider.eventCategoriesTap[index],
                          isSelected: provider.selectedCategory == index,
                        ),
                      ),
                  separatorBuilder: (context, index) => SizedBox(width: 12),
                  itemCount: provider.eventCategoriesTap.length,
                ),
              ),
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

  RoundedRectangleBorder _shapeStyle() {
    return RoundedRectangleBorder(
      borderRadius: const BorderRadius.only(
        bottomRight: Radius.circular(24),
        bottomLeft: Radius.circular(24),
      ),
    );
  }
}
