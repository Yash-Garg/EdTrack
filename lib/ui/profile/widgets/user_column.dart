import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../data/api/endpoints.dart';
import '../../../data/models/user/user_model.dart';
import '../../theme_data.dart';

class UserColumn extends StatelessWidget {
  const UserColumn({
    super.key,
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 130,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(1000),
                child: CachedNetworkImage(
                  imageUrl: '${Endpoints.fileBlob}/${user.profilePictureId}',
                  fit: BoxFit.cover,
                  height: 130,
                  width: 130,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        Text(
          '${user.firstName} ${user.lastName}',
          style: AppTheme.bodyMedium.copyWith(
            fontSize: 30,
            color: Colors.black,
            letterSpacing: 0,
          ),
        ),
        SizedBox(height: 10),
        Text(
          'UUID - ${user.loginName}',
          style: AppTheme.bodyMedium.copyWith(fontSize: 15),
        ),
        Text(
          'Admission No. - ${user.admissionNumber}',
          style: AppTheme.bodyMedium.copyWith(fontSize: 15),
        ),
      ],
    );
  }
}
