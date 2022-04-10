import '../../models/user/user_attendance.dart';
import 'widgets/attendance_card.dart';
import 'widgets/header.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../api/endpoints.dart';
import '../../cubits/home/home_cubit.dart';
import '../../injectable.dart';
import '../../models/user/user_model.dart';
import '../../theme_data.dart';

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
      body: SafeArea(
        child: BlocBuilder<HomeCubit, HomeState>(
          bloc: _homeCubit,
          builder: (context, state) {
            if (state.loading) {
              return Center(child: CircularProgressIndicator());
            }
            if (state.user != null) {
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Header(user: state.user!),
                    SizedBox(height: 20),
                    AttendanceCard(attendance: state.attendance!),
                  ],
                ),
              );
            }
            return Center(child: Text('Error fetching data...'));
          },
        ),
      ),
    );
  }
}
