import 'package:flutter/material.dart';
import 'package:tic_tac_toe/Pages/Game_Page.dart';

class Intro_Screen extends StatefulWidget {
  Intro_Screen({super.key});

  @override
  State<Intro_Screen> createState() => _Intro_ScreenState();
}

class _Intro_ScreenState extends State<Intro_Screen> {
  var name1contrl = TextEditingController();
  var name2contrl = TextEditingController();
  double player1Opacity = 0.0;
  double player2Opacity = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade900,
      body: Center(
        child: Container(
          margin: EdgeInsets.only(left: 30, right: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Enter Player Names',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                ),),
              SizedBox(height: 25,),
              Opacity(
                opacity: player1Opacity,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Text(
                    'Please enter Player One name',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.red
                    ),
                  ),
                ),
              ),
              TextField(
                  controller: name1contrl,
                  style: TextStyle(
                      color: Colors.redAccent,
                      fontWeight: FontWeight.bold
                  ),
                  decoration: InputDecoration(
                    fillColor: Colors.black54,
                    filled: true,
                    labelText: 'Player One',
                    hintText: 'Name here',
                    labelStyle: TextStyle(
                        color: Colors.white
                    ),
                    hintStyle: TextStyle(
                        color: Colors.white
                    ),
                    prefixIcon: Container(
                      margin: EdgeInsets.only(left: 20, right: 30),
                      width: 30,
                      height: 30,
                      child: Image.asset('assets/images/cross2.png'),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: Colors.black,
                            width: 2.0
                        )
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        width: 3.0,
                        color: Colors.white70,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        width: 3.0,
                        color: Colors.red
                      )
                    ),

                  ),

              ),
              SizedBox(height: 5,),
              Opacity(
                opacity: player2Opacity,
                child: Text(
                  'Please enter Player Two name',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.red
                  ),
                ),
              ),
              SizedBox(height: 4,),
              TextField(
                  controller: name2contrl,
                  style: TextStyle(
                      color: Colors.yellowAccent,
                      fontWeight: FontWeight.bold
                  ),
                  decoration: InputDecoration(
                    fillColor: Colors.black54,
                    filled: true,
                    labelText: 'Player Two',
                    hintText: 'Name here',
                    labelStyle: TextStyle(
                        color: Colors.white
                    ),
                    hintStyle: TextStyle(
                        color: Colors.white
                    ),
                    prefixIcon: Container(
                      margin: EdgeInsets.only(left: 20, right: 30),
                      width: 30,
                      height: 30,
                      child: Image.asset('assets/images/crossy.png'),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: Colors.black,
                            width: 2.0
                        )
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        width: 3.0,
                        color: Colors.white70,
                      ),
                    ),

                  )
              ),
              SizedBox(height: 30,),
              ElevatedButton(
                onPressed: (){
                  print('START GAME');
                  if(name1contrl.text.isEmpty)
                    {
                      print('Please Fill Name player 1');
                      setState(() {
                        player1Opacity = 1.0;
                      });
                    }
                  else{
                    print('player1 filled');
                    setState(() {
                      player1Opacity = 0.0;
                    });
                  }
                  if(name2contrl.text.isEmpty)
                  {
                    print('Please Fill Name player 2');
                    setState(() {
                      player2Opacity = 1.0;
                    });
                  }
                  else {
                    print('player2 filled');
                    setState(() {
                      player2Opacity = 0.0;
                    });
                  }

                  if(name1contrl.text.isEmpty || name2contrl.text.isEmpty)
                      return;

                  var name1 = name1contrl.text.toString();
                  var name2 = name2contrl.text.toString();
                  print('Player One: $name1\nPlayer Two: $name2');
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return Game_Interface_Screen(nam1: name1,nam2: name2,);
                  }));
                }, child: Padding(
                padding: const EdgeInsets.only(top: 10,bottom: 10,left: 50,right: 50),
                child: Text(
                  'START GAME',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
                style: ElevatedButton.styleFrom(
                    elevation: 10.0,
                    backgroundColor: Colors.blue.shade900,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
