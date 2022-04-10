import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../cubits/config/config_cubit.dart';
import '../../injectable.dart';
import '../../theme_data.dart';
import '../common/custom_textfield.dart';
import '../common/loading_dialog.dart';
import '../common/wide_fab.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Initially password is obscure
  bool _obscureText = true;
  final _userController = TextEditingController();
  final _passController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  void dispose() {
    _userController.dispose();
    _passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    'assets/login.svg',
                    height: 300,
                  ),
                  Text(
                    'Tell us more about yourself by signing in!',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 30),
                  CustomTextField(
                    controller: _userController,
                    validator: (val) => val != null && val.isNotEmpty
                        ? null
                        : 'Invalid username',
                    decoration: InputDecoration(
                      labelText: 'Username',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.alternate_email),
                    ),
                  ),
                  SizedBox(height: 20),
                  CustomTextField(
                    controller: _passController,
                    validator: (val) => val != null && val.isNotEmpty
                        ? null
                        : 'Invalid password',
                    obscure: _obscureText,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: const OutlineInputBorder(),
                      prefixIcon: Icon(Icons.lock_outline),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                        ),
                        onPressed: () => _toggle(),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            'Forgot password?',
                            style: TextStyle(
                              fontSize: 15,
                              color: AppTheme.mildBlack,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: WideFab(
        label: 'LOGIN',
        onPressed: _proceed,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  _proceed() async {
    if (formKey.currentState?.validate() ?? false) {
      showLoadingDialog(context);
      getIt<ConfigCubit>().setCredentials(
        context: context,
        username: _userController.text.trim(),
        password: _passController.text.trim(),
      );
    }
  }
}
