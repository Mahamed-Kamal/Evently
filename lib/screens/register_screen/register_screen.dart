import 'package:easy_localization/easy_localization.dart';
import 'package:evently/core/app_assets.dart';
import 'package:evently/App%20Utils/dialog_utils.dart';
import 'package:evently/App%20Utils/validation_utils.dart';
import 'package:evently/firebase/firebase_manager.dart';
import 'package:evently/screens/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import '../../widgets/custom_already_have_account.dart';
import '../../widgets/language_switcher/language_switcher.dart';
import '../../widgets/loading_buttom.dart';
import '../../widgets/text_field_item.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = "Register-Screen";

  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController rePasswordController = TextEditingController();

  var formKey = GlobalKey<FormState>();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "register".tr(),
          style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 20),
        ),
        iconTheme: IconThemeData(
          color: Theme.of(context).textTheme.bodySmall?.color,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                spacing: 12,
                children: [
                  Image.asset(
                    AppAssets.eventlyHeader,
                    alignment: Alignment.topCenter,
                    height: size * .22,
                  ),
                  TextFieldItem(
                    hintText: "name".tr(),
                    icon: Icons.person,
                    controller: nameController,
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return "please_enter_your_name".tr(); // error not filed
                      }
                      return null; // this filed is valid
                    },
                  ),
                  TextFieldItem(
                    hintText: "email".tr(),
                    icon: Icons.email,
                    controller: emailController,
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return "please_enter_your_email".tr();
                      }
                      if (!ValidationUtils.isValidEmail(text)) {
                        return "please_enter_a_valid_email".tr();
                      }
                      return null;
                    },
                  ),
                  TextFieldItem(
                    hintText: "password".tr(),
                    icon: Icons.lock,
                    isPassword: true,
                    controller: passwordController,
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return "please_enter_your_password".tr();
                      }
                      if (text.length < 6) {
                        return "please_enter_a_valid_password".tr();
                      }
                      return null;
                    },
                  ),
                  TextFieldItem(
                    hintText: "rePassword".tr(),
                    icon: Icons.lock,
                    isPassword: true,
                    controller: rePasswordController,
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return "please_enter_your_rePassword".tr();
                      }
                      if (passwordController.text !=
                          rePasswordController.text) {
                        return "password doesn't match".tr();
                      }
                      return null;
                    },
                  ),
                  ElevatedButton(
                    onPressed:
                        isLoading
                            ? null
                            : () {
                              createAccount();
                            },
                    child:
                        isLoading
                            ? LoadingButtom()
                            : Text(
                              "create_account".tr(),
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                  ),
                  CustomAlreadyHaveAccount(),
                  Center(child: LanguageSwitcher()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void createAccount() {
    if (formKey.currentState?.validate() == false) {
      return;
    }
    FirebaseManager.createAccount(
      emailController.text,
      passwordController.text,
      nameController.text,
      onLoading: (value) {
        setState(() {
          isLoading = value;
        });
      },
      onSuccess: () {
        showMessageDialog(
          "successful_registration".tr(),
          posActionTitle: "ok".tr(),
          posAction: () {
            Navigator.pushReplacementNamed(context, LoginScreen.routeName);
          },
        );
      },
      onError: (message) {
        showMessageDialog(message, posActionTitle: "ok".tr());
      },
    );
  }
}
