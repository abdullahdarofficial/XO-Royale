import 'package:flutter/material.dart';
import 'package:tic_tac_toe/Pages/Game_Page.dart';
import 'package:tic_tac_toe/Pages/Intro_Screen.dart';

class End_Screen extends StatefulWidget {
  final String status;
  final String result;
  final String name1;
  final String name2;
  const End_Screen({
    Key? key,
    required this.status,
    required this.result,
    required this.name1,
    required this.name2,
  }) : super(key: key);

  @override
  State<End_Screen> createState() => _End_ScreenState();
}

class _End_ScreenState extends State<End_Screen> {
  var status = '';
  var result = '';
  var name1 = '';
  var name2 = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    status = widget.status;
    result = widget.result;
    name1=widget.name1;
    name2=widget.name2;
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade900,
      body: Container(
        margin: EdgeInsets.only(left: 50,right: 50),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                        width: 4,
                        color: Colors.white
                    )
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        child: Image.asset(
                            'assets/images/cross2.png'
                        ),
                      ),
                      SizedBox(width: 5,),
                      Container(
                        width: 40,
                        height: 40,
                        child: Image.asset(
                            'assets/images/crossy.png'
                        ),
                      ),
                      SizedBox(width: 10,),
                      Text('Royale',
                        style: TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),)
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30,),
              Container(
                decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(30)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(status,
                    style: TextStyle(
                        fontSize: 25,
                        wordSpacing: 2,
                        fontWeight: FontWeight.bold,
                        color: Colors.yellowAccent
                    ),),
                ),
              ),
              SizedBox(height: 50,),
              Text(result,
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                ),),
              SizedBox(height: 40,),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                    return Intro_Screen();
                  }));                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue.shade900, // Background color
                  onPrimary: Colors.white, // Text color
                  elevation: 4, // Depth of the button
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16), // Button padding
                  minimumSize: Size(200, 60), // Minimum width and height
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15), // Button border radius
                  ),
                ),
                child: Text(
                  'Change Players',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20,),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                    return Game_Interface_Screen(nam1: name1, nam2: name2);
                  }));
                  },
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue.shade900, // Background color
                  onPrimary: Colors.white, // Text color
                  elevation: 4, // Depth of the button
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16), // Button padding
                  minimumSize: Size(200, 60), // Minimum width and height
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15), // Button border radius
                  ),
                ),
                child: Text(
                  'Play Again',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )


            ],
          ),
        ),
      ),
    );
  }
}
