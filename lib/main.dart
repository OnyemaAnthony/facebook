import 'package:facebook/screens/home_screen.dart';
import 'package:facebook/utitlities.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Facebook UI web/mobile',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Utilities.scaffold,
      ),
      home:HomeScreen(),
    );
  }
}

