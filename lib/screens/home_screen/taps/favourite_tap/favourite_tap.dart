import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../firebase/firebase_manager.dart';
import '../../../../models/task_model.dart';
import '../../../../widgets/event_item.dart';

class FavouriteTap extends StatelessWidget {
  const FavouriteTap({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            children: [
              Padding(
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
              ),
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

  OutlineInputBorder _styleBorder(BuildContext context) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: Theme.of(context).primaryColor),
      borderRadius: const BorderRadius.all(Radius.circular(16)),
    );
  }
}
