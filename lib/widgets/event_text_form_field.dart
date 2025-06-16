import 'package:flutter/material.dart';

typedef FieldValidator = String? Function(String?)?;

class EventTextFormField extends StatelessWidget {
  int maxLines;

  bool isIcon;
  String labelText;
  FieldValidator validator;
  TextEditingController? controller;

  EventTextFormField({
    required this.labelText,
    this.maxLines = 1,
    this.isIcon = false,
    this.validator,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      validator: validator,
      controller: controller,
      style: Theme.of(context).textTheme.bodySmall,
      decoration: InputDecoration(
        label:
            isIcon
                ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.edit_note_outlined,
                      color: Theme.of(context).textTheme.labelSmall!.color,
                    ),
                    Text(
                      labelText,
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ],
                )
                : Text(
                  labelText,
                  style: Theme.of(context).textTheme.labelSmall,
                ),
        alignLabelWithHint: true,
      ),
    );
  }
}
