import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:list_model_cubit_repo_api/layout/cubit/home_cubit.dart';
import 'package:list_model_cubit_repo_api/shared/common_colors.dart';
import 'package:list_model_cubit_repo_api/shared/di.dart';

import 'layout/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => di<HomeCubit>()..getPosts(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // basic theme and back ground
        theme: ThemeData(primarySwatch: kPrimaryColor),
        home: Scaffold(
          backgroundColor: kPrimaryColor,
          appBar: AppBar(
            centerTitle: true,
            title: Text('Cubit + Repository + Dio'),
          ),
          // go to home layout
          body: HomeScreen(),
        ),
      ),
    );
  }
}
