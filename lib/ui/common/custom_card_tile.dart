import 'package:flutter/material.dart';

import '../../ui/theme_data.dart';

class CustomCardTile extends StatelessWidget {
  final String title, subtitle;
  final IconData icon;
  final Color bgColor, iconColor;
  final double? height;

  const CustomCardTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.bgColor,
    required this.iconColor,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 190,
      height: height,
      child: Card(
        shape: AppTheme.cardShape,
        elevation: .0,
        color: bgColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: CircleAvatar(
                maxRadius: 25,
                backgroundColor: Color.fromARGB(156, 255, 255, 255),
                child: Icon(
                  icon,
                  color: iconColor,
                  size: 25,
                ),
              ),
            ),
            ListTile(
              minVerticalPadding: 10,
              title: Text(
                title,
                style: AppTheme.titleMedium.copyWith(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              subtitle: Text(
                subtitle,
                style: AppTheme.bodyMedium.copyWith(fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
