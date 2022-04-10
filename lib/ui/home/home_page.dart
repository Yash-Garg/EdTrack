import 'package:akgec_erp/api/endpoints.dart';
import 'package:cached_network_image/cached_network_image.dart';
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

  var items = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.calendar_month_outlined),
      label: 'Attendance',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person_rounded),
      label: 'Profile',
    ),
  ];

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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Welcome, ${state.user!.firstName}!',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ClipOval(
                      child: CachedNetworkImage(
                        imageUrl:
                            '${Endpoints.fileBlob}/${state.user!.profilePictureId}',
                        fit: BoxFit.cover,
                        width: 50,
                        height: 50,
                      ),
                    )
                  ],
                ),
              );
            }
            return Center(child: Text('Error fetching data...'));
          },
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(items: items),
    );
  }
}
