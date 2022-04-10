import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            FlutterLogo(size: 100),
            SizedBox(height: 60),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 70.0),
              child: LinearProgressIndicator(),
            ),
          ],
        ),
      ),
    );
  }
}
