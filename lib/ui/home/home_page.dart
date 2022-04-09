import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/config/config_cubit.dart';
import '../../injectable.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ConfigCubit _configCubit;

  @override
  void initState() {
    _configCubit = getIt<ConfigCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<ConfigCubit, ConfigState>(
        bloc: _configCubit,
        builder: (context, state) {
          return Center(
            child: Text(state.isLoggedIn ? 'Logged IN' : 'Error'),
          );
        },
      ),
    );
  }
}
