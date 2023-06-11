import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../data/cubits/config/config_cubit.dart';
import '../../injectable.dart';
import '../../utils/keys.dart';
import '../../ui/theme_data.dart';
import '../../utils/constants.dart';
import '../common/custom_textfield.dart';
import '../common/wide_fab.dart';
import '../password/reset_password.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static Route<dynamic> route() {
    return CupertinoPageRoute<dynamic>(
      builder: (_) => const LoginPage(),
    );
  }

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Initially password is obscure
  bool _obscureText = true;
  bool _isLoading = false;

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
        bottom: false,
        child: SingleChildScrollView(
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
                    Assets.loginSvg,
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
                    key: WidgetKeys.loginField,
                    isReadOnly: _isLoading,
                    controller: _userController,
                    validator: (val) => val != null && val.isNotEmpty
                        ? null
                        : 'Invalid username',
                    inputType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Edumarshal Username',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.alternate_email),
                    ),
                  ),
                  SizedBox(height: 20),
                  CustomTextField(
                    key: WidgetKeys.passwordField,
                    isReadOnly: _isLoading,
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
                  // SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          // Unfocus textfield before pushing route
                          FocusManager.instance.primaryFocus?.unfocus();
                          Navigator.push(context, ResetPassword.route());
                        },
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
                  SizedBox(height: MediaQuery.of(context).size.height / 16),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: WideFab(
        label: 'Login',
        isLoading: _isLoading,
        onPressed: _proceed,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  _proceed() async {
    if (formKey.currentState?.validate() ?? false) {
      FocusManager.instance.primaryFocus?.unfocus();

      setState(() {
        _isLoading = true;
      });
      await getIt<ConfigCubit>().setCredentials(
        navigator: Navigator.of(context),
        username: _userController.text.trim(),
        password: _passController.text.trim(),
      );
      setState(() {
        _isLoading = false;
      });
    }
  }
}
