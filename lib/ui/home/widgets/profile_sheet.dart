import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../api/endpoints.dart';
import '../../../models/user/user_model.dart';

class ProfileSheet extends StatelessWidget {
  final User user;

  const ProfileSheet({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: .7,
      maxChildSize: .7,
      builder: ((context, controller) {
        return ListView(
          physics: BouncingScrollPhysics(),
          controller: controller,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 25.0,
                vertical: 30.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey.withOpacity(.3),
                    ),
                    child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(Icons.close),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 130,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10000),
                    child: CachedNetworkImage(
                      imageUrl:
                          '${Endpoints.fileBlob}/${user.profilePictureId}',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
