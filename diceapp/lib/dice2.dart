import 'package:flutter/material.dart';
import 'dart:math';

class Dice2 extends StatefulWidget {
  const Dice2({Key? key}) : super(key: key);

  @override
  State<Dice2> createState() => _Dice2State();
}

class _Dice2State extends State<Dice2> {
  int LDN = 4;
  int RDN = 5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        backgroundColor: Colors.teal,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Text(
          //   "Let's Roll",
          //   style: TextStyle(
          //     fontWeight: FontWeight.bold,
          //     fontFamily: 'RockSalt',
          //     fontSize: 50, color: Colors.red,
          //     // fontFamily: ,
          //   ),
          // ),
          Row(
            children: [
              Expanded(
                child: Image.asset('images/Dice$LDN.png'),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Image.asset("images/Dice$RDN.png"),
              ),
            ],
          ),
          SizedBox(
            height: 25,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Colors.lightGreenAccent.shade400,
                onPrimary: Colors.teal.shade800,
                elevation: 10.0,
                padding: EdgeInsets.all(6),
                fixedSize: Size(150, 50),
                shadowColor: Colors.teal,
                textStyle: TextStyle(fontSize: 25),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(9))),
            child: Text(
              'Tap',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.black),
            ),
            onPressed: () {
              setState(() {
                LDN = Random().nextInt(6) + 1;
                RDN = Random().nextInt(6) + 1;
              });
            },
          )
        ],
      ),
    );
  }
}
