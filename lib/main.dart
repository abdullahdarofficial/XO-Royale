// Importing necessary Flutter package for Material Design widgets
import 'package:flutter/material.dart';

// Importing the necessary pages for the Tic Tac Toe game
import 'package:tic_tac_toe/Pages/End_Screen.dart';
import 'package:tic_tac_toe/Pages/Game_Page.dart';
import 'package:tic_tac_toe/Pages/Splash_Screen.dart';

// Main function to run the Flutter app
void main() {
  runApp(const MyApp());
}

// Defining the main widget for the application
class MyApp extends StatelessWidget {
  // Constructor for MyApp with optional key parameter
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Building the MaterialApp which sets the structure of the app
    return MaterialApp(
      title: 'Tic Tac Toe', // Setting the title of the app
      debugShowCheckedModeBanner: false, // Disabling the debug banner
      home: Splash_Screen(), // Setting the splash screen as the initial page
    );
  }
}
