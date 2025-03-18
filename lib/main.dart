import 'package:cashapp/pages/home_screen.dart';
import 'package:cashapp/pages/send_money_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Money App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white70.withOpacity(0.97),
      ),
      home: HomeScreen(),
    );
  }
}
