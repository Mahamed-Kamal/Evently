import 'package:evently/core/firebase/firebase_manager.dart';
import 'package:evently/data/models/user_model.dart';
import 'package:evently/features/register/view_model/register_connector.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterViewModel extends ChangeNotifier {
  RegisterConnector? registerConnector;

  Future<void> addUser(UserModel user) {
    var collection = FirebaseManager.getUserCollection();
    var docRef = collection.doc(user.id);
    return docRef.set(user);
  }

  Future<void> createAccount(String email, String password, String name) async {
    try {
      // onLoading(true);
      registerConnector!.showLoading(true);
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
      registerConnector!.showSuccessMessage();
      // onSuccess();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        registerConnector!.showErrorMessage(error: e.message);
        //onError(e.message);
      } else if (e.code == 'email-already-in-use') {
        //onError(e.message);
        registerConnector!.showErrorMessage(error: e.message);
      }
    } catch (e) {
      //onError("Something went wrong");
      registerConnector!.showErrorMessage(error: "Something went wrong");
    }
    registerConnector!.showLoading(false);
    // onLoading(false);
  }
}
