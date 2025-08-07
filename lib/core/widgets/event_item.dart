import 'package:evently/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../firebase/firebase_manager.dart';
import '../utils/data_time_utils.dart';
import '../../data/models/task_model.dart';

class EventItem extends StatelessWidget {
  final TaskModel model;
  final bool isColor = false;

  const EventItem({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    double heightSize = MediaQuery.of(context).size.height;
    var provider = Provider.of<UserProvider>(context);
    return Container(
      width: double.infinity,
      height: heightSize * .27,
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        image: DecorationImage(
          image: AssetImage(
            "assets/images/${model.category?.toLowerCase()}.png",
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            child: Column(
              children: [
                Text(
                  DateTime.fromMillisecondsSinceEpoch(
                    model.date ?? 0,
                  ).toString().substring(8, 10),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  formatDateToMonth(model.date ?? 0),
                  style: Theme.of(
                    context,
                  ).textTheme.titleMedium!.copyWith(fontSize: 14),
                ),
              ],
            ),
          ),
          Spacer(),
          Container(
            padding: EdgeInsets.only(left: 8, right: 4),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            child: Row(
              children: [
                Text(
                  model.title ?? "",
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall!.copyWith(color: Colors.black),
                ),
                Spacer(),
                IconButton(
                  onPressed: () {
                    provider.updateIsFavoriteTask(model);
                  },
                  icon: Icon(
                    model.isFavourite
                        ? CupertinoIcons.heart_fill
                        : CupertinoIcons.heart,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    FirebaseManager.deleteTask(model.id ?? "");
                  },
                  icon: Icon(
                    Icons.delete_outline,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
