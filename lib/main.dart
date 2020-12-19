import 'package:flutter/material.dart';
import 'package:list_model_cubit_repo_api/shared/common_colors.dart';

import 'layout/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
    );
  }
}
