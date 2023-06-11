import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../data/cubits/home/home_cubit.dart';
import '../../injectable.dart';
import '../../ui/theme_data.dart';
import '../../utils/constants.dart';
import 'widgets/attendance_card.dart';
import 'widgets/header.dart';
import 'widgets/stats_row.dart';
import 'widgets/subjects_list_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static Route<dynamic> route() {
    return CupertinoPageRoute<dynamic>(
      builder: (_) => const HomePage(),
    );
  }

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
        bottom: false,
        child: BlocBuilder<HomeCubit, HomeState>(
          bloc: _homeCubit,
          builder: (context, state) {
            if (state.loading) {
              return Center(
                child: LottieBuilder.asset(
                  Assets.loadingAnim,
                  frameRate: FrameRate.max,
                  width: MediaQuery.of(context).size.width / 1.5,
                ),
              );
            }
            if (state.user != null && !state.loading) {
              return RefreshIndicator(
                onRefresh: () async => await _homeCubit.refresh(),
                color: AppTheme.accentBlue,
                child: Scrollbar(
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                    padding: const EdgeInsets.all(20.0),
                    children: [
                      Header(user: state.user!),
                      SizedBox(height: 20),
                      AttendanceCard(attendance: state.attendance!),
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0, bottom: 10.0),
                        child: Text(
                          'Your Statistics',
                          style: AppTheme.bodyMedium.copyWith(
                            color: Colors.black,
                            fontSize: 22,
                          ),
                        ),
                      ),
                      StatsRow(
                        attendanceDetails: state.attendance!.stdSubAtdDetails,
                        batch: state.userBatch!,
                      ),
                      SizedBox(height: 20),
                      if (state.attendance!.stdSubAtdDetails.subjects != null)
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 5.0, bottom: 15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'All Subjects',
                                style: AppTheme.bodyMedium.copyWith(
                                  color: Colors.black,
                                  fontSize: 22,
                                ),
                              ),
                              Text(
                                'Click on the subject to know more.',
                                style: AppTheme.bodyMedium.copyWith(
                                  color: AppTheme.mildBlack.withOpacity(.5),
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      if (state.attendance!.stdSubAtdDetails.subjects != null)
                        SubjectsListView(attendance: state.attendance!)
                    ],
                  ),
                ),
              );
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LottieBuilder.asset(Assets.errorAnim),
                TextButton(
                  child: Text(
                    'Reload',
                    textAlign: TextAlign.center,
                    style: AppTheme.bodyMedium.copyWith(fontSize: 20),
                  ),
                  onPressed: () => _homeCubit
                    ..reset()
                    ..started(),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
