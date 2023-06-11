import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../theme_data.dart';
import '../../common/app_logo.dart';

class AboutAppSheet extends StatefulWidget {
  const AboutAppSheet({super.key});

  @override
  State<AboutAppSheet> createState() => _AboutAppSheetState();
}

class _AboutAppSheetState extends State<AboutAppSheet> {
  String version = '';

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _getAppVersion();
  }

  _getAppVersion() async {
    final package = await PackageInfo.fromPlatform();
    setState(() {
      version = package.version;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 70),
        AppLogo(),
        SizedBox(height: 50),
        Text(
          'App Version - v$version',
          style: AppTheme.bodyMedium.copyWith(
            fontSize: 16,
            color: AppTheme.mildBlack.withOpacity(.5),
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 10),
        InkWell(
          borderRadius: BorderRadius.circular(5.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'View on GitHub',
              style: AppTheme.bodyMedium.copyWith(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
          onTap: () => launchUrl(
            Uri.parse('https://github.com/Yash-Garg/EdTrack'),
            mode: LaunchMode.externalApplication,
          ),
        ),
        SizedBox(height: 50),
      ],
    );
  }
}
