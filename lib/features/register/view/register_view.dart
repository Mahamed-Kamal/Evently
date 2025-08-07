import 'package:easy_localization/easy_localization.dart';
import 'package:evently/core/route_manager/routes.dart';
import 'package:evently/core/utils/dialog_utils.dart';
import 'package:evently/core/utils/validation_utils.dart';
import 'package:evently/features/register/view/widgets/create_account_text.dart';
import 'package:evently/features/register/view/widgets/image_evently_header.dart';
import 'package:evently/features/register/view_model/register_connector.dart';
import 'package:evently/features/register/view_model/register_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'widgets/custom_already_have_account.dart';
import '../../../core/widgets/language_switcher.dart';
import '../../../core/widgets/loading_button.dart';
import '../../../core/widgets/app_text_form_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen>
    implements RegisterConnector {
  bool isLoading = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  var viewModel = RegisterViewModel();

  @override
  void initState() {
    super.initState();
    viewModel.registerConnector = this;
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    rePasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                spacing: 12.h,
                children: [
                  const ImageEventlyHeader(),
                  AppTextFormField(
                    hintText: "name",
                    icon: Icons.person,
                    controller: nameController,
                    validator: ValidationUtils.isValidName,
                  ),
                  AppTextFormField(
                    hintText: "email",
                    icon: Icons.email,
                    controller: emailController,
                    validator: ValidationUtils.isValidEmail,
                  ),
                  AppTextFormField(
                    hintText: "password",
                    icon: Icons.lock,
                    isPassword: true,
                    controller: passwordController,
                    validator: ValidationUtils.isValidPassword,
                  ),
                  AppTextFormField(
                    hintText: "rePassword",
                    icon: Icons.lock,
                    isPassword: true,
                    controller: rePasswordController,
                    validator: (rePassword) =>
                        ValidationUtils.isValidRePassword(
                            rePassword, passwordController.text),
                  ),
                  ElevatedButton(
                    onPressed: isLoading ? null : () => createAccount(),
                    child: isLoading
                        ? const LoadingButton()
                        : const CreateAccountText(),
                  ),
                  const CustomAlreadyHaveAccount(),
                  const Center(child: LanguageSwitcher()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  createAccount() {
    if (formKey.currentState?.validate() == false) {
      return;
    }
    viewModel.createAccount(
      emailController.text,
      passwordController.text,
      nameController.text,
    );
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
    showMessageDialog(
      "successful_registration".tr(),
      posActionTitle: "ok".tr(),
      posAction: () {
        Navigator.pushReplacementNamed(context, Routes.loginScreen);
      },
    );

  }
}
