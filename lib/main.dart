import 'package:cashapp/pages/main_screen.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Money App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // ignore: deprecated_member_use
        scaffoldBackgroundColor: Colors.white70.withOpacity(0.97),
      ),
      home: MainScreen(),
    );
  }
}
