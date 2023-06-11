import 'package:flutter/material.dart';

import '../../ui/theme_data.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final bool obscure, isReadOnly;
  final InputDecoration decoration;
  final TextInputType? inputType;
  final Function(String?) validator;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.validator,
    required this.decoration,
    this.inputType,
    this.isReadOnly = false,
    this.obscure = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(fontSize: 16, letterSpacing: 1),
      controller: controller,
      cursorColor: AppTheme.mildBlack,
      maxLines: 1,
      obscureText: obscure,
      readOnly: isReadOnly,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (val) => validator(val),
      decoration: decoration,
      keyboardType: inputType,
    );
  }
}
