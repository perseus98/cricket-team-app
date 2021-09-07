import 'package:country_player_app/screens/first_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Country Player App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: FirstScreen(),
    );
  }
}
