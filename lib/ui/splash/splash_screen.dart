import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../ui/theme_data.dart';
import '../../utils/box.dart';
import '../common/app_logo.dart';
import '../home/home_page.dart';
import '../login/login_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Future.delayed(Duration(seconds: 1)).then((_) async {
        await BoxUtils.checkLogin().then(
          (isLoggedIn) => Navigator.pushReplacement(
            context,
            isLoggedIn ? HomePage.route() : LoginPage.route(),
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
          Center(child: AppLogo()),
          Positioned(
            bottom: Platform.isIOS ? 30.0 : 20.0,
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
