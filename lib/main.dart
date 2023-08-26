import 'package:flutter/material.dart';
import 'package:tic_tac_toe/Pages/Splash_Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tic Tac Toe',
      debugShowCheckedModeBanner: false,
     home: Splash_Screen(),
    );
  }
}
