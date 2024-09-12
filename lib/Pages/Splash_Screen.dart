import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tic_tac_toe/Pages/Intro_Screen.dart';


class Splash_Screen extends StatefulWidget {
  const Splash_Screen({super.key});

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
 var _opacity = 0.0;
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 1),(){
      setState(() {
        _opacity=1.0;
      });
    });

     Timer(Duration(seconds: 4),(){
       Navigator.pushReplacement(
           context, MaterialPageRoute(
           builder: (context){
         return Intro_Screen();
       }));
     });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade900,
      body: Container(
        child: Center(
          child: AnimatedOpacity(
            opacity: _opacity,
            duration: Duration(seconds: 2),
            curve: Curves.easeInOut,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      child: Image.asset(
                          'assets/images/cross2.png'
                      ),
                    ),
                    SizedBox(width: 10,),
                    Container(
                      width: 60,
                      height: 60,
                      child: Image.asset(
                          'assets/images/crossy.png'
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Text('Royale',
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
