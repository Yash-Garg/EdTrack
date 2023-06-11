import 'package:flutter/material.dart';

import '../../ui/theme_data.dart';

class CustomShadowCard extends StatelessWidget {
  final Widget child;
  final double height;
  final double width;

  const CustomShadowCard({
    super.key,
    required this.child,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            height: height - 15,
            width: width - 32,
            decoration: BoxDecoration(
              color: AppTheme.mildBlack.withOpacity(.1),
              borderRadius: BorderRadius.all(
                Radius.circular(AppTheme.cardRadius),
              ),
            ),
          ),
        ),
        SizedBox(
          width: width,
          height: height,
          child: Card(
            shape: AppTheme.cardShape,
            elevation: 5,
            child: child,
          ),
        ),
      ],
    );
  }
}
