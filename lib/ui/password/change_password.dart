import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../data/api/login_api.dart';
import '../../data/cubits/config/config_cubit.dart';
import '../../injectable.dart';
import '../../utils/constants.dart';
import '../common/custom_snackbar.dart';
import '../common/custom_textfield.dart';
import '../common/wide_fab.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  static Route<dynamic> route() {
    return CupertinoPageRoute<dynamic>(
      builder: (_) => const ChangePassword(),
    );
  }

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  bool _isLoading = false;
  final _oldPassController = TextEditingController();
  final _newPassController = TextEditingController();
  final _confirmPassController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _oldPassController.dispose();
    _newPassController.dispose();
    _confirmPassController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        reverse: true,
        physics: BouncingScrollPhysics(),
        children: [
          Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: LottieBuilder.asset(
                      Assets.passwordAnim,
                      fit: BoxFit.fill,
                      repeat: false,
                    ),
                  ),
                  Text(
                    'Change\nPassword.',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Please enter the required credentials below to continue.',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 30),
                  CustomTextField(
                    isReadOnly: _isLoading,
                    controller: _oldPassController,
                    obscure: true,
                    validator: (val) => val != null && val.isNotEmpty
                        ? null
                        : 'Invalid password',
                    decoration: InputDecoration(
                      labelText: 'Old Password',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.key),
                    ),
                  ),
                  SizedBox(height: 20),
                  CustomTextField(
                    isReadOnly: _isLoading,
                    controller: _newPassController,
                    obscure: true,
                    validator: (val) => val != null && val.isNotEmpty
                        ? null
                        : 'Invalid password',
                    decoration: InputDecoration(
                      labelText: 'New Password',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.password_rounded),
                    ),
                  ),
                  SizedBox(height: 20),
                  CustomTextField(
                    isReadOnly: _isLoading,
                    controller: _confirmPassController,
                    obscure: true,
                    validator: (val) => val != null &&
                            val.isNotEmpty &&
                            val == _newPassController.text.trim()
                        ? null
                        : 'Passwords do not match',
                    decoration: InputDecoration(
                      labelText: 'Confirm New Password',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.password_rounded),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 10),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: WideFab(
        label: 'Update',
        onPressed: _update,
        isLoading: _isLoading,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  _update() async {
    if (formKey.currentState?.validate() ?? false) {
      FocusManager.instance.primaryFocus?.unfocus();
      setState(() {
        _isLoading = true;
      });

      final creds = getIt<ConfigCubit>().state.credentials;

      final response = await getIt<LoginApi>().changePassword(
        authToken: creds!.accessToken!,
        userId: creds.userId!,
        newPassword: _newPassController.text.trim(),
        oldPassword: _oldPassController.text.trim(),
      );

      response.fold(
        (updated) {
          if (updated) {
            Navigator.pop(context);
            showCustomSnack(
              context: context,
              message: 'Password updated successfully.',
              bgColor: Colors.green,
            );
          }
        },
        (err) => showCustomSnack(context: context, message: err.message),
      );

      setState(() {
        _isLoading = false;
      });
    }
  }
}
