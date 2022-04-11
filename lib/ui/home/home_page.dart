import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../cubits/home/home_cubit.dart';
import '../../injectable.dart';
import '../../theme_data.dart';
import '../../utils/constants.dart';
import 'widgets/attendance_card.dart';
import 'widgets/header.dart';
import 'widgets/stats_row.dart';

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
              return Center(
                child: LottieBuilder.asset(
                  Constants.loadingAnim,
                  frameRate: FrameRate.max,
                  width: MediaQuery.of(context).size.width / 1.5,
                ),
              );
            }
            if (state.user != null) {
              return ListView(
                physics: BouncingScrollPhysics(),
                padding: const EdgeInsets.all(20.0),
                children: [
                  Header(user: state.user!),
                  SizedBox(height: 20),
                  AttendanceCard(attendance: state.attendance!),
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0, bottom: 5.0),
                    child: Text(
                      'Your Statistics',
                      style: AppTheme.titleMedium.copyWith(
                        color: Colors.black,
                        fontSize: 22,
                      ),
                    ),
                  ),
                  StatsRow(
                      attendanceDetails: state.attendance!.stdSubAtdDetails),
                ],
              );
            }
            return Center(
              child: LottieBuilder.asset(
                Constants.errorAnim,
                frameRate: FrameRate.max,
              ),
            );
          },
        ),
      ),
    );
  }
}
