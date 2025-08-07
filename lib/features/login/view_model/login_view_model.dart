import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../core/firebase/firebase_manager.dart';
import 'login_connector.dart';

class LoginViewModel extends ChangeNotifier {
  LoginConnector? loginConnector;

  Future<void> login(String email, String password) async {
    try {
      loginConnector!.showLoading(true);
      //onLoading(true);
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      FirebaseManager.readUser();
      //onSuccess();
      loginConnector!.showSuccessMessage();
      // if(credential.user!.emailVerified){
      //   onSuccess();
      // }else{
      // onError("Please verify your email , check your mail");
      //}
    } on FirebaseAuthException catch (e) {
      loginConnector?.showErrorMessage(error: e.message);
      // onError(e.message);
    }
    //onLoading(false);
    loginConnector!.showLoading(false);
  }
}
