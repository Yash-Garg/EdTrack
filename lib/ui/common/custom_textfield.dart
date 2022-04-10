import 'package:flutter/material.dart';

import '../../theme_data.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final bool obscure;
  final InputDecoration decoration;
  final Function(String?) validator;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.validator,
    required this.decoration,
    this.obscure = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(fontSize: 16, letterSpacing: 1),
      controller: controller,
      cursorColor: AppTheme.mildBlack,
      maxLines: 1,
      obscureText: obscure,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (val) => validator(val),
      decoration: decoration,
    );
  }
}
