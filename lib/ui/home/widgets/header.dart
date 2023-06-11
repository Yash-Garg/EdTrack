import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../data/api/endpoints.dart';
import '../../../data/models/user/user_model.dart';
import '../../profile/profile_sheet.dart';

class Header extends StatelessWidget {
  final User user;
  const Header({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome, ${user.firstName}!',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(user.email),
              ],
            ),
          ),
          InkWell(
            borderRadius: BorderRadius.circular(1000),
            onTap: () => showModalBottomSheet(
              context: context,
              useRootNavigator: true,
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              builder: (_) => ProfileSheet(user: user),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(1000),
              child: CachedNetworkImage(
                imageUrl: '${Endpoints.fileBlob}/${user.profilePictureId}',
                fit: BoxFit.cover,
                width: 50,
                height: 50,
              ),
            ),
          )
        ],
      ),
    );
  }
}
