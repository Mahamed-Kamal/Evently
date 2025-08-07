import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/data/models/task_model.dart';
import 'package:evently/features/main_layout/taps/favourite_tap/view/widgets/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/firebase/firebase_manager.dart';
import '../../../../../core/widgets/event_item.dart';

class FavouriteTap extends StatelessWidget {
  const FavouriteTap({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 16.h),
          child: Column(
            children: [
              const SearchWidget(),
              Expanded(
                child: StreamBuilder<QuerySnapshot<TaskModel>>(
                  stream: FirebaseManager.getTaskFilterIsFavourite(),
                  builder: (context, snapshot) {
                    return ListView.builder(
                      itemCount: snapshot.data?.docs.length ?? 0,
                      itemBuilder:
                          (context, index) => EventItem(
                            model: snapshot.data!.docs[index].data(),
                          ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
