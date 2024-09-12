import 'package:flutter/material.dart';
import 'package:tic_tac_toe/Pages/End_Screen.dart';
import 'dart:async';


class Game_Interface_Screen extends StatefulWidget {
  final String nam1;
  final String nam2;

  const Game_Interface_Screen({
    Key? key,
    required this.nam1,
    required this.nam2,
  }) : super(key: key);

  @override
  State<Game_Interface_Screen> createState() => _Game_Interface_ScreenState();
}

class _Game_Interface_ScreenState extends State<Game_Interface_Screen> {

  var player1name = '';
  var player2name = '';
  var player1brcol = Colors.white;
  var player2brcol = Colors.transparent;
  var cards = [0,0,0,0,0,0,0,0,0];
  var circle = 'assets/images/crossy.png';
  var cross = 'assets/images/cross2.png';
  String blank = 'assets/images/trans1.png';
  var turn = 1;
  String ? c1,c2,c3,c4,c5,c6,c7,c8,c9;
  var winner = 0;
  var colors = [Colors.black54, Colors.black54, Colors.black54,
    Colors.black54, Colors.black54, Colors.black54,
    Colors.black54, Colors.black54,Colors.black54,];
  var result = '';
  var result_status = '';
  var checkDraw = 0;
  @override


  void initState() {
    super.initState();
    c1 = c2 = c3 = c4 = c5 = c6 = c7 = c8 = c9 = blank;
    player1name=widget.nam1;
    player2name=widget.nam2;
  }

  void _check_Winner() {
    checkDraw = 1;
    for(int i=0;i<9;i++)
      {
        if(cards[i]==0)
          checkDraw = 0;
      }
    if(checkDraw == 1)
      {
        result_status = 'Well Played';
        result = 'Draw Match';
        nextScreen();
      }
    //------------ Winner logic
    for(int i=0; i<8;i+=3) {
      if(cards[i] == cards[i+1] && cards[i+1] == cards[i+2] && cards[i] != 0){
        //horizantal
        result = 'Congratulations!';

        setState(() {
          colors[i] = Colors.white;
          colors[i+1] = Colors.white;
          colors[i+2] = Colors.white;
        });
        if(turn == 1)
        {
          winner = 1;
          result_status = '$player1name Won the match';
        }
        else
        {
          result_status = '$player2name Won the match';
          winner = 2;
        }
      }
    }
    for(int i=0; i<3;i++) {
      if(cards[i] == cards[i+3] && cards[i+3] == cards[i+6] && cards[i] != 0){
        //vertical
        result = 'Congratulations!';

        setState(() {
          colors[i] = Colors.white;
          colors[i+3] = Colors.white;
          colors[i+6] = Colors.white;
        });

        if(turn == 1)
        {
          result_status = '$player1name Won the match';
          winner = 1;
        }
        else
        {
          result_status = '$player2name Won the match';
          winner = 2;
        }
      }
    }
    if(cards[0] == cards[4] && cards[4] == cards[8] && cards[0] != 0) {
      result = 'Congratulations!';

      setState(() {
        colors[0] = Colors.white;
        colors[4] = Colors.white;
        colors[8] = Colors.white;
      });

      if(turn == 1)
      {
        result_status = '$player1name Won the match';
        winner = 1;
      }
      else
      {
        result_status = '$player2name Won the match';
        winner = 2;
      }
    }
    if(cards[2] == cards[4] && cards[4] == cards[6] && cards[2] != 0) {
      result = 'Congratulations!';

      setState(() {
        colors[2] = Colors.white;
        colors[4] = Colors.white;
        colors[6] = Colors.white;
      });
      if(turn == 1)
      {
        result_status = '$player1name Won the match';
        winner = 1;
      }
      else
      {
        result_status = '$player2name Won the match';
        winner = 2;
      }
    }
    //------------
    if(winner!=0)
    {
      nextScreen();
      return;
    }
    if(turn == 1) {
      turn = 2;
      setState(() {
        player1brcol = Colors.transparent;
        player2brcol = Colors.white;
      });
    }
    else {
      turn = 1;
      setState(() {
        player2brcol = Colors.transparent;
        player1brcol = Colors.white;
      });
    }
  }
  void nextScreen() {
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return End_Screen(status: result, result: result_status, name1: player1name, name2: player2name,);
      }));
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade900,
      body: Container(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                              color: player1brcol,
                              width: 3.0
                          )
                      ),
                      padding: EdgeInsets.only(top: 20,bottom: 20,left: 20,right: 20),
                      child: Column(
                        children: [
                          Text(player1name,
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                            ),),
                          SizedBox(height: 20,),
                          Container(
                              width: 35,
                              height: 35,
                              child: Image.asset('assets/images/cross2.png')
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                              color: player2brcol,
                              width: 3.0
                          )
                      ),
                      padding: EdgeInsets.only(top: 20,bottom: 20,left: 20,right: 20),
                      child: Column(
                        children: [
                          Text(player2name,
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                            ),),
                          SizedBox(height: 20,),
                          Container(
                              width: 35,
                              height: 35,
                              child: Image.asset('assets/images/crossy.png')),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 80,),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.deepPurple.shade600,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  margin: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: (){
                                var index = 0;
                                if(cards[index] == 0 && winner == 0) {
                                  cards[index] = turn;
                                  print('No 1');
                                  if(turn == 1)
                                    setState(() {
                                      c1 = cross;
                                    });
                                  else if(turn == 2)
                                    setState(() {
                                      c1=circle;
                                    });
                                  _check_Winner();
                                }
                              },
                              child: Container(
                                margin: EdgeInsets.only(top: 10,left: 10),
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Image.asset('$c1'),
                                ),
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: colors[0],
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: (){
                                var index = 1;
                                if(cards[index] == 0 && winner == 0) {
                                  cards[index] = turn;
                                  print('No 2');                                cards[index] = turn;
                                  if(turn == 1)
                                    setState(() {
                                      c2 = cross;
                                    });
                                  else if(turn == 2)
                                    setState(() {
                                      c2=circle;
                                    });
                                  _check_Winner();
                                }
                              },
                              child: Container(
                                margin: EdgeInsets.only(top: 10,left: 10),
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Image.asset('$c2'),
                                ),
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: colors[1],
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: (){
                                var index = 2;
                                if(cards[index] == 0 && winner == 0) {
                                  cards[index] = turn;
                                  print('No 3');
                                  if(turn == 1)
                                    setState(() {
                                      c3 = cross;
                                    });
                                  else if(turn == 2)
                                    setState(() {
                                      c3=circle;
                                    });
                                  _check_Winner();
                                }
                              },
                              child: Container(
                                margin: EdgeInsets.only(top: 10,left: 10, right: 10),
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Image.asset('$c3'),
                                ),
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: colors[2],
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: (){
                                var index = 3;
                                if(cards[index] == 0 && winner == 0) {
                                  cards[index] = turn;
                                  print('No 4');
                                  if(turn == 1)
                                    setState(() {
                                      c4 = cross;
                                    });
                                  else if(turn == 2)
                                    setState(() {
                                      c4=circle;
                                    });
                                  _check_Winner();
                                }
                              },
                              child: Container(
                                margin: EdgeInsets.only(top: 10,left: 10),
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Image.asset('$c4'),
                                ),
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: colors[3],
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: (){
                                var index = 4;
                                if(cards[index] == 0 && winner == 0) {
                                  cards[index] = turn;
                                  print('No 5');
                                  if(turn == 1)
                                    setState(() {
                                      c5 = cross;
                                    });
                                  else if(turn == 2)
                                    setState(() {
                                      c5=circle;
                                    });
                                  _check_Winner();
                                }
                              },
                              child: Container(
                                margin: EdgeInsets.only(top: 10,left: 10),
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Image.asset('$c5'),
                                ),
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: colors[4],
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: (){
                                var index = 5;
                                if(cards[index] == 0 && winner == 0) {
                                  cards[index] = turn;
                                  print('No 6');
                                  if(turn == 1)
                                    setState(() {
                                      c6 = cross;
                                    });
                                  else if(turn == 2)
                                    setState(() {
                                      c6=circle;
                                    });
                                  _check_Winner();
                                }
                              },
                              child: Container(
                                margin: EdgeInsets.only(top: 10,left: 10, right: 10),
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Image.asset('$c6'),
                                ),
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: colors[5],
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: (){
                                var index = 6;
                                if(cards[index] == 0 && winner == 0) {
                                  cards[index] = turn;
                                  print('No 7');
                                  if(turn == 1)
                                    setState(() {
                                      c7 = cross;
                                    });
                                  else if(turn == 2)
                                    setState(() {
                                      c7 = circle;
                                    });
                                  _check_Winner();
                                }
                              },
                              child: Container(
                                margin: EdgeInsets.only(top: 10,left: 10,bottom: 10),
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Image.asset('$c7'),
                                ),
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: colors[6],
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: (){
                                var index = 7;
                                if(cards[index] == 0 && winner == 0) {
                                  cards[index] = turn;
                                  print('No 8');
                                  if(turn == 1)
                                    setState(() {
                                      c8 = cross;
                                    });
                                  else if(turn == 2)
                                    setState(() {
                                      c8 =circle;
                                    });
                                  _check_Winner();
                                }
                              },
                              child: Container(
                                margin: EdgeInsets.only(top: 10,left: 10,bottom: 10),
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Image.asset('$c8'),
                                ),
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: colors[7],
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: (){
                                var index = 8;
                                if(cards[index] == 0 && winner == 0) {
                                  cards[index] = turn;
                                  print('No 9');
                                  if(turn == 1)
                                    setState(() {
                                      c9 = cross;
                                    });
                                  else if(turn == 2)
                                    setState(() {
                                      c9 = circle;
                                    });
                                  _check_Winner();
                                }
                              },
                              child: Container(
                                margin: EdgeInsets.only(top: 10,left: 10,bottom: 10, right: 10),
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Image.asset('$c9'),
                                ),
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: colors[8],
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
