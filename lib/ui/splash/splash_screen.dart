import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../theme_data.dart';
import '../../utils/box.dart';
import '../home/home_page.dart';
import '../login/login_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    SchedulerBinding.instance?.addPostFrameCallback((_) {
      Future.delayed(Duration(seconds: 1)).then((_) async {
        final isLoggedIn = await BoxUtils.checkLogin();
        Navigator.pushReplacement(
          context,
          CupertinoPageRoute(
            builder: (_) => isLoggedIn ? HomePage() : LoginPage(),
          ),
        );
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Center(child: FlutterLogo(size: 100)),
          Positioned(
            bottom: 40.0,
            child: Column(
              children: [
                Text(
                  'Built by Yash Garg',
                  style: AppTheme.bodyMedium,
                ),
                Text(
                  'Powered by Edumarshal',
                  style: AppTheme.bodyMedium,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
