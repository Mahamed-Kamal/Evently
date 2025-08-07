import 'package:flutter/material.dart';
import 'custom_login_with_google.dart';

class LoginWithGoogleButton extends StatelessWidget {
  const LoginWithGoogleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        elevation: 0,
        side: BorderSide(color: Theme.of(context).primaryColor),
      ),
      onPressed: () {},
      child: const CustomLoginWithGoogle(),
    );
  }
}
