import 'package:flutter/material.dart';

import '../../theme_data.dart';

class WideFab extends StatelessWidget {
  final String label;
  final Function() onPressed;
  const WideFab({
    Key? key,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: AppTheme.accentBlue,
          elevation: 3,
        ),
        onPressed: onPressed,
        child: Text(
          label,
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            letterSpacing: 1,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
