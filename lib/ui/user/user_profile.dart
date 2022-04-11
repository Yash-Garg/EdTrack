import 'package:flutter/material.dart';

import '../../models/user/user_model.dart';
import '../../theme_data.dart';

class UserProfile extends StatefulWidget {
  final User user;

  const UserProfile({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: AppTheme.bodyMedium.copyWith(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
