import 'package:flutter/material.dart';

extension Dialogs on State {
  void showMessageDialog(
    String message, {
    String? posActionTitle,
    VoidCallback? posAction,
    String? negActionTitle,
    VoidCallback? negAction,
  }) {
    List<Widget> actions = [];
    if (posActionTitle != null) {
      actions.add(
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            posAction?.call();
          },
          child: Text(
            posActionTitle,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
      );
    }
    if (negActionTitle != null) {
      actions.add(
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            negAction?.call();
          },
          child: Text(
            negActionTitle,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
      );
    }
    showDialog(
      context: context,
      builder: (buildContext) {
        return AlertDialog(
          content: Text(message),
          actions: actions,
          actionsPadding: EdgeInsets.all(6),
        );
      },
    );
  }
}
