import 'package:easy_localization/easy_localization.dart';
import 'package:evently/core/route_manager/routes.dart';
import 'package:evently/core/utils/dialog_utils.dart';
import 'package:evently/core/utils/validation_utils.dart';
import 'package:evently/features/login/view/widgets/donot_have_account_and_create_account.dart';
import 'package:evently/features/login/view/widgets/forget_password_widget.dart';
import 'package:evently/features/login/view/widgets/image_login.dart';
import 'package:evently/features/login/view/widgets/login_text.dart';
import 'package:evently/features/login/view_model/login_connector.dart';
import 'package:evently/features/login/view_model/login_view_model.dart';
import 'package:evently/providers/user_provider.dart';
import 'package:evently/core/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'widgets/divider_or_item.dart';
import '../../../core/widgets/language_switcher.dart';
import '../../../core/widgets/loading_button.dart';
import 'widgets/login_with_google_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> implements LoginConnector {
  bool isLoading = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  var viewModel = LoginViewModel();

  @override
  void initState() {
    super.initState();
    // dh m3nh an impl hna
    viewModel.loginConnector = this;
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  spacing: 16.h,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const ImageLogin(),
                    AppTextFormField(
                      hintText: "email".tr(),
                      icon: Icons.email,
                      controller: emailController,
                      validator: ValidationUtils.isValidEmail,
                    ),
                    AppTextFormField(
                      hintText: "password".tr(),
                      isPassword: true,
                      icon: Icons.lock,
                      controller: passwordController,
                      validator: ValidationUtils.isValidPassword,
                    ),
                    const ForgetPasswordWidget(),
                    ElevatedButton(
                      onPressed: isLoading ? null : () => login(),
                      child:
                          isLoading ? const LoadingButton() : const LoginText(),
                    ),
                    const DoNotHaveAccountAndCreateAccount(),
                    const DividerOrItem(),
                    const LoginWithGoogleButton(),
                    const Center(child: LanguageSwitcher()),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  login() {
    if (formKey.currentState?.validate() == false) {
      return;
    }
    viewModel.login(emailController.text, passwordController.text);
  }

  @override
  showErrorMessage({String? error}) {
    showMessageDialog(error ?? "", posActionTitle: "ok".tr());
  }

  @override
  showLoading(bool changeLoading) {
    setState(() {
      isLoading = changeLoading;
    });
  }

  @override
  showSuccessMessage() {
    var provider = Provider.of<UserProvider>(context, listen: false);
    showMessageDialog(
      "logged_in_successfully".tr(),
      posActionTitle: "ok".tr(),
      posAction: () async {
        await provider.initUser();
      },
    );
    Navigator.pushNamedAndRemoveUntil(
      context,
      Routes.mainLayout,
      (route) => false,
    );
  }
}
