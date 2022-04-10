import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/home/home_cubit.dart';
import '../../injectable.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeCubit _homeCubit;

  @override
  void initState() {
    _homeCubit = getIt<HomeCubit>()..started();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeCubit, HomeState>(
        bloc: _homeCubit,
        builder: (context, state) {
          if (state.loading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state.user != null) {
            return Center(
              child: Text(
                '${state.user!.firstName} ${state.user!.lastName} - ${state.user!.userId}',
                style: TextStyle(fontSize: 18),
              ),
            );
          }
          return Center(child: Text('ERROR FETCHING DATA'));
        },
      ),
    );
  }
}
