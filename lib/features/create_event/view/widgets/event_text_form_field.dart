import 'package:flutter/material.dart';

typedef FieldValidator = String? Function(String?)?;

class EventTextFormField extends StatelessWidget {
  final int maxLines;
  final bool isIcon;
  final String labelText;
  final FieldValidator validator;
  final TextEditingController? controller;

  const EventTextFormField({
    super.key,
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
