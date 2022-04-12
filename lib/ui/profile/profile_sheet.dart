import 'package:akgec_erp/utils/box.dart';
import 'package:flutter/material.dart';

import '../../models/user/user_model.dart';
import 'widgets/setting_card.dart';
import 'widgets/user_column.dart';

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
            UserColumn(user: user),
            // Padding(
            //   padding: const EdgeInsets.symmetric(vertical: 30.0),
            //   child: Divider(
            //     thickness: 1,
            //     height: 10,
            //     indent: 30,
            //     endIndent: 30,
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: [
                  SettingCard(
                    title: 'Change password',
                    leading: Icons.change_circle_outlined,
                    trailing: Icons.keyboard_arrow_right_outlined,
                    onTap: () {},
                  ),
                  SizedBox(height: 5),
                  SettingCard(
                    title: 'Sign out',
                    leading: Icons.logout_rounded,
                    trailing: Icons.keyboard_arrow_right_outlined,
                    onTap: () async =>
                        await BoxUtils.deleteCredentials(context),
                  ),
                ],
              ),
            )
          ],
        );
      }),
    );
  }
}
