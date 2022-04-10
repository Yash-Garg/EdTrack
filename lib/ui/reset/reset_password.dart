import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../api/login_api.dart';
import '../../injectable.dart';
import '../common/custom_textfield.dart';
import '../common/wide_fab.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  bool _isLoading = false;
  final _admissionController = TextEditingController();
  final _mobileController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        reverse: true,
        physics: BouncingScrollPhysics(),
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  'assets/forgot.svg',
                  height: 300,
                ),
                Text(
                  'Forgot\nPassword?',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Don\'t worry! It happens. Please enter the details associated with your account.',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 30),
                CustomTextField(
                  isReadOnly: _isLoading,
                  controller: _admissionController,
                  validator: (val) => val != null && val.isNotEmpty
                      ? null
                      : 'Invalid admission no',
                  decoration: InputDecoration(
                    labelText: 'Admission No',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.numbers),
                  ),
                ),
                SizedBox(height: 20),
                CustomTextField(
                  isReadOnly: _isLoading,
                  controller: _mobileController,
                  validator: (val) =>
                      val != null && val.isNotEmpty && val.length == 10
                          ? null
                          : 'Invalid mobile numner',
                  decoration: InputDecoration(
                    labelText: 'Mobile No',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.phone_android_outlined),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 10),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: WideFab(
        label: 'Reset',
        isLoading: _isLoading,
        onPressed: () async {
          if (formKey.currentState?.validate() ?? false) {
            FocusManager.instance.primaryFocus?.unfocus();
            setState(() {
              _isLoading = true;
            });

            final response = await getIt<LoginApi>().resetPassword(
              admissionNumber: _admissionController.text.trim(),
              mobileNumber: _mobileController.text.trim(),
            );

            response.fold(
              (sent) {
                if (sent) {}
              },
              (r) => null,
            );
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
