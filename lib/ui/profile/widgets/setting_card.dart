import 'package:flutter/material.dart';

import '../../../theme_data.dart';

class SettingCard extends StatelessWidget {
  final Icon leading, trailing;
  final String title;
  final Function()? onTap;

  const SettingCard({
    Key? key,
    required this.leading,
    required this.trailing,
    required this.title,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey.withOpacity(.2),
      shape: AppTheme.cardShape,
      elevation: 0,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppTheme.cardRadius),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            contentPadding: EdgeInsets.only(left: 8.0),
            minLeadingWidth: 0,
            leading: leading,
            trailing: trailing,
            title: Text(
              title,
              style: AppTheme.bodyMedium.copyWith(fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}
