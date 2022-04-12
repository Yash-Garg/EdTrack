import 'package:akgec_erp/theme_data.dart';
import 'package:akgec_erp/ui/common/wide_fab.dart';
import 'package:flutter/material.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Change password',
          style: AppTheme.bodyMedium.copyWith(
            fontSize: 16,
            letterSpacing: 0,
            color: Colors.black,
          ),
        ),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [],
      ),
      floatingActionButton: WideFab(
        label: 'Submit',
        onPressed: () {},
        isLoading: true,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
