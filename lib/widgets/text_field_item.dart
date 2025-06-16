import 'package:flutter/material.dart';

class TextFieldItem extends StatefulWidget {
  String hintText;
  IconData icon;
  bool isPassword;
  TextEditingController controller;

  String? Function(String?)? validator;

  TextFieldItem({
    super.key,
    required this.hintText,
    required this.icon,
    this.isPassword = false,
    required this.controller,
    required this.validator,
  });

  @override
  State<TextFieldItem> createState() => _TextFieldItemState();
}

class _TextFieldItemState extends State<TextFieldItem> {
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
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: Theme.of(context).textTheme.labelSmall,
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
      cursorColor: Theme.of(context).hintColor,
      style: Theme.of(context).textTheme.bodySmall,
    );
  }
}
