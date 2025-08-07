import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:evently/data/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../data/models/task_model.dart';

class FirebaseManager {
  // FireStore  Storage to Data in FireStore
  static CollectionReference<TaskModel> getTasksCollection() {
    return FirebaseFirestore.instance
        .collection("Tasks")
        .withConverter<TaskModel>(
          fromFirestore:
              (snapshot, options) => TaskModel.fromFireStore(snapshot.data()),
          toFirestore: (model, options) => model.toFireStore(),
        );
  }

  static CollectionReference<UserModel> getUserCollection() {
    return FirebaseFirestore.instance
        .collection("Users")
        .withConverter<UserModel>(
          fromFirestore:
              (snapshot, options) => UserModel.fromFireStore(snapshot.data()),
          toFirestore: (model, options) => model.toFireStore(),
        );
  }

  static Future<void> addTask(TaskModel task) {
    var collection = getTasksCollection();
    var docRef = collection.doc();
    // init id here
    task.id = docRef.id;
    return docRef.set(task);
  }

  // Here Function used id to crated  and Storage auth in FireStore
  static Future<void> addUser(UserModel user) {
    var collection = getUserCollection();
    var docRef = collection.doc(user.id);
    return docRef.set(user);
  }

  // read user in DataBase by search with id
  static Future<UserModel?> readUser() async {
    var docRef = getUserCollection().doc(
      FirebaseAuth.instance.currentUser!.uid,
    );
    var docSnapShot = await docRef.get();
    var user = docSnapShot.data();
    return user;
  }

  static Stream<QuerySnapshot<TaskModel>> getTask(String category) {
    var collection = getTasksCollection();
    if (category == "all".tr()) {
      return collection
          .where("userId", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .orderBy("date")
          .snapshots();
    } else {
      return collection
          .where("userId", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .where("category", isEqualTo: category)
          .orderBy("date")
          .snapshots();
    }
  }

  static Stream<QuerySnapshot<TaskModel>> getTaskFilterIsFavourite() {
    var collection = getTasksCollection();
    return collection
        .where("userId", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .where("isFavourite", isEqualTo: true)
        .orderBy("date")
        .snapshots();
  }

  static Future<void> deleteTask(String id) {
    var collection = getTasksCollection();
    return collection.doc(id).delete();
  }

  Future<void> updateEvent(TaskModel task) {
    var collection = getTasksCollection();
    return collection.doc(task.id).update(task.toFireStore());
  }

  static Future<void> createAccount(
    String email,
    String password,
    String name, {
    required Function onSuccess,
    required Function onError,
    required Function onLoading,
  }) async {
    try {
      onLoading(true);
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      credential.user!.sendEmailVerification();
      UserModel user = UserModel(
        id: credential.user!.uid,
        email: email,
        name: name,
        createAt: DateTime.now().millisecondsSinceEpoch,
      );
      addUser(user);
      onSuccess();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        onError(e.message);
      } else if (e.code == 'email-already-in-use') {
        onError(e.message);
      }
    } catch (e) {
      onError("Something went wrong");
    }
    onLoading(false);
  }

}
