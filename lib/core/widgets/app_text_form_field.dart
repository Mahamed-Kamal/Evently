import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AppTextFormField extends StatefulWidget {
  final String hintText;
  final IconData icon;
  final bool isPassword;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextStyle? hintStyle;

  const AppTextFormField({
    super.key,
    required this.hintText,
    required this.icon,
    this.isPassword = false,
    required this.controller,
    required this.validator,
    this.hintStyle,
  });

  @override
  State<AppTextFormField> createState() => _TextFieldItemState();
}

class _TextFieldItemState extends State<AppTextFormField> {
  late bool isObscure;

  @override
  void initState() {
    isObscure = widget.isPassword;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isObscure,
      validator: widget.validator,
      controller: widget.controller,
      cursorColor: Theme.of(context).hintColor,
      style: Theme.of(context).textTheme.bodySmall,
      decoration: InputDecoration(
        hintText: widget.hintText.tr(),
        hintStyle: widget.hintStyle ?? Theme.of(context).textTheme.labelSmall,
        prefixIcon: Icon(widget.icon),
        suffixIcon:
            widget.isPassword
                ? IconButton(
                  onPressed: () {
                    isObscure = !isObscure;
                    setState(() {});
                  },
                  icon:
                      isObscure
                          ? Icon(Icons.visibility_off_outlined)
                          : Icon(Icons.visibility),
                )
                : null,
      ),
    );
  }
}
