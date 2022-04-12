import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class AppLogo extends StatelessWidget {
  final double? size;
  const AppLogo({Key? key, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFffc0c0),
        borderRadius: BorderRadius.circular(30),
      ),
      height: size ?? 150,
      width: size ?? 150,
      child: Image.asset(
        Assets.appIcon,
        fit: BoxFit.cover,
      ),
    );
  }
}
