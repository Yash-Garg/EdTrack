import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../api/endpoints.dart';
import '../../../models/user/user_model.dart';

class Header extends StatelessWidget {
  final User user;
  const Header({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FittedBox(
            child: Text(
              'Welcome, ${user.firstName}!',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Column();
                },
              );
            },
            child: ClipOval(
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
