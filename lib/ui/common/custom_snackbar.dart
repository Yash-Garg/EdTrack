import 'package:flutter/material.dart';

import '../../ui/theme_data.dart';

Future<void> showCustomSnack({
  required BuildContext context,
  String? message,
  Color? bgColor,
}) async {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: Text(
          message ?? 'Something went wrong.',
          style: TextStyle(fontFamily: AppTheme.fontFamily),
        ),
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        backgroundColor: bgColor ?? Colors.red.withOpacity(.7),
      ),
    );
}
