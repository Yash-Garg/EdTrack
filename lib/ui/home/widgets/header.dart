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
            onTap: () => _showProfileSheet(context),
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

  void _showProfileSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return DraggableScrollableSheet(
          builder: ((context, scrollController) {
            return Column();
          }),
        );
      },
    );
  }
}
