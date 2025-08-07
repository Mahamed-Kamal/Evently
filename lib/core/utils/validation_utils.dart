import 'package:easy_localization/easy_localization.dart';

class ValidationUtils {

  static String? isValidEmail(String? email) {
    RegExp emailRegex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[com]+");
    if (email == null || email
        .trim()
        .isEmpty) {
      return "please_enter_your_email".tr();
    } else if (!emailRegex.hasMatch(email)) {
      return "please_enter_a_valid_email".tr();
    } else {
      return null;
    }
  }

  static String? isValidName(String? text) {
    if (text == null || text
        .trim()
        .isEmpty) {
      return "please_enter_your_name".tr(); // error not filed
    }
    return null;
  }

  static String? isValidPassword(String? text) {
    if (text == null || text
        .trim()
        .isEmpty) {
      return "please_enter_your_email".tr();
    }
    return null;
  }

  static String? isValidRePassword(String? rePassword, String? password) {
    if (rePassword == null || rePassword
        .trim()
        .isEmpty) {
      return "please_enter_your_rePassword".tr();
    } else if (password != rePassword) {
      return "password doesn't match";
    }
    return null;
  }

  static String? isValidTitle(String? text) {
    if (text == null || text
        .trim()
        .isEmpty) {
      return "please_enter_event_title".tr();
    }
    return null;
  }

  static String? isValidDescription(String? text) {
    if (text == null || text
        .trim()
        .isEmpty) {
      return "please_enter_event_description".tr();
    }
    return null;
  }



}
