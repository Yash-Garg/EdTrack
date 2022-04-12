import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/user/user_model.dart';
import '../../theme_data.dart';
import '../../utils/box.dart';
import '../password/change_password.dart';
import 'widgets/setting_card.dart';
import 'widgets/user_column.dart';

class ProfileSheet extends StatelessWidget {
  final User user;

  const ProfileSheet({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: .8,
      maxChildSize: .9,
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
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: [
                  SettingCard(
                    title: 'Change password',
                    leading: Icons.change_circle_outlined,
                    trailing: Icons.keyboard_arrow_right_outlined,
                    onTap: () => Navigator.of(context)
                      ..pop()
                      ..push(
                        CupertinoPageRoute(builder: (_) => ChangePassword()),
                      ),
                  ),
                  SizedBox(height: 10),
                  SettingCard(
                    title: 'Sign out',
                    leading: Icons.logout_rounded,
                    trailing: Icons.keyboard_arrow_right_outlined,
                    onTap: () => _confirm(context),
                  ),
                  SizedBox(height: 10),
                  SettingCard(
                    title: 'About',
                    leading: Icons.info_outline_rounded,
                    trailing: Icons.keyboard_arrow_right_outlined,
                    onTap: () {},
                  ),
                ],
              ),
            )
          ],
        );
      }),
    );
  }

  _confirm(BuildContext context) async {
    Navigator.pop(context);
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          contentPadding: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
          content: Text(
            'Are you sure you want to sign out?',
            style: AppTheme.bodyMedium.copyWith(
              fontSize: 18,
              color: Colors.red,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                'Cancel',
                style: AppTheme.bodyMedium.copyWith(
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
            ),
            TextButton(
              onPressed: () async => await BoxUtils.deleteCredentials(context),
              child: Text(
                'Confirm',
                style: AppTheme.bodyMedium.copyWith(
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
