import 'package:evently/firebase/firebase_manager.dart';
import 'package:evently/models/task_model.dart';
import 'package:evently/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  UserModel? userModel;
  User? firebaseUser;

  UserProvider() {
    firebaseUser = FirebaseAuth.instance.currentUser;

    if (firebaseUser != null) {
      initUser();
    }
  }

  initUser() async {
    userModel = await FirebaseManager.readUser();
    notifyListeners();
  }

  updateIsFavoriteTask(TaskModel task) {
    FirebaseManager.getTasksCollection().doc(task.id).update({
      "isFavourite": !task.isFavourite,
    });
    notifyListeners();
  }

  void isLogout() {
    FirebaseAuth.instance.signOut();
    userModel = null;
    firebaseUser = null;
  }
}
