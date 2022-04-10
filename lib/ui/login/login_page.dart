import 'package:akgec_erp/cubits/config/config_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../api/login_api.dart';
import '../../injectable.dart';
import '../../utils/box.dart';
import '../../utils/constants.dart';
import '../common/loading_dialog.dart';
import '../home/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _userController = TextEditingController();
  final _passController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _userController.dispose();
    _passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Constants.APP_NAME),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              SizedBox(height: 4),
              TextFormField(
                controller: _userController,
                maxLines: null,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (val) =>
                    val != null && val.isNotEmpty ? null : 'Invalid username',
                decoration: InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.person),
                ),
              ),
              SizedBox(height: 12),
              TextFormField(
                controller: _passController,
                obscureText: true,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (val) =>
                    val != null && val.isNotEmpty ? null : 'Invalid password',
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.password),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _proceed,
        icon: Icon(Icons.login),
        enableFeedback: true,
        label: Text('CONTINUE'),
      ),
    );
  }

  _proceed() async {
    if (formKey.currentState?.validate() ?? false) {
      showLoadingDialog(context);
      final tokenResponse = await getIt<LoginApi>().getAccessToken(
        username: _userController.text.trim(),
        password: _passController.text.trim(),
      );
      tokenResponse.fold(
        (model) async {
          final isAccountSet = await BoxUtils.setAccount(tokenModel: model);
          if (isAccountSet) {
            getIt<ConfigCubit>().state.copyWith(isLoggedIn: true);
            Navigator.of(context)
              ..pop()
              ..pop();
            Navigator.push(
              context,
              CupertinoPageRoute(builder: (_) => HomePage()),
            );
          }
        },
        (err) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(err.message!)),
          );
        },
      );
    }
  }
}
