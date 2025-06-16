import 'package:easy_localization/easy_localization.dart';
import 'package:evently/App%20Utils/dialog_utils.dart';
import 'package:evently/firebase/firebase_manager.dart';
import 'package:evently/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/app_assets.dart';
import '../../App Utils/validation_utils.dart';
import '../../widgets/custom_login_with_google/custom_login_with_google.dart';
import '../../widgets/divider_or_item.dart';
import '../../widgets/language_switcher/language_switcher.dart';
import '../../widgets/loading_buttom.dart';
import '../../widgets/text_field_item.dart';
import '../forget_password_screen/forget_password_screen.dart';
import '../home_screen/home_screen.dart';
import '../register_screen/register_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = "Login-Screen";

  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                spacing: 12,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset(
                    AppAssets.eventlyHeader,
                    alignment: Alignment.topCenter,
                    height: size * .22,
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
                    isPassword: true,
                    icon: Icons.lock,
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
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                        context,
                        ForgetPasswordScreen.routeName,
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "forget_password?".tr(),
                          style: Theme.of(context).textTheme.titleSmall!
                              .copyWith(decoration: TextDecoration.underline),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed:
                        isLoading
                            ? null
                            : () {
                              login();
                            },
                    child:
                        isLoading
                            ? LoadingButtom()
                            : Text(
                              "login".tr(),
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "don't_have_account".tr(),
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            RegisterScreen.routeName,
                          );
                        },
                        child: Text(
                          "create_account".tr(),
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ),
                    ],
                  ),
                  DividerOrItem(),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      side: BorderSide(color: Theme.of(context).primaryColor),
                    ),
                    onPressed: () {},
                    child: CustomLoginWithGoogle(),
                  ),
                  Center(child: LanguageSwitcher()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  login() {
    var provider = Provider.of<UserProvider>(context, listen: false);

    if (formKey.currentState?.validate() == false) {
      return;
    }

    FirebaseManager.login(
      emailController.text,
      passwordController.text,
      onLoading: (changeLoading) {
        setState(() {
          isLoading = changeLoading;
        });
      },
      onSuccess: () {
        showMessageDialog(
          "logged_in_successfully".tr(),
          posActionTitle: "ok".tr(),
          posAction: () async {
            await provider.initUser();
            Navigator.pushNamedAndRemoveUntil(
              context,
              HomeScreen.routeName,
              (route) => false,
            );
          },
        );
      },
      onError: (message) {
        showMessageDialog(message, posActionTitle: "ok".tr());
      },
    );
  }
}
