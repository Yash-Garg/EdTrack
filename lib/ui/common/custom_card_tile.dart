import 'package:flutter/material.dart';

import '../../theme_data.dart';

class CustomCardTile extends StatelessWidget {
  final String title, subtitle;
  final IconData icon;
  final Color bgColor, iconColor;

  const CustomCardTile({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.bgColor,
    required this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 190,
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
                backgroundColor: Colors.white,
                child: Icon(
                  icon,
                  color: iconColor,
                  size: 25,
                ),
              ),
            ),
            ListTile(
              title: Text(
                title,
                style: AppTheme.titleMedium.copyWith(
                  fontSize: 17,
                  color: Colors.black,
                ),
              ),
              subtitle: Text(
                subtitle,
                style: AppTheme.titleMedium.copyWith(
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
