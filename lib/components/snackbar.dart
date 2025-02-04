import 'package:flutter/material.dart';

enum SnackbarType {
  success,
  error,
  warning,
  info,
}

void showFloatingSnackbar(BuildContext context, String message) {
  final snackBar = SnackBar(
    content: Text(message),
    behavior: SnackBarBehavior.floating,
    margin: const EdgeInsets.only(
      bottom: 80,
      left: 20,
      right: 20,
    ),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
