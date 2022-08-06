import 'package:flutter/material.dart';
import 'dart:math';

class Dice1 extends StatefulWidget {
  const Dice1({Key? key}) : super(key: key);

  @override
  State<Dice1> createState() => _Dice1State();
}

class _Dice1State extends State<Dice1> {
  int dicenumber = 4;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(backgroundColor: Colors.teal),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image(
              height: 250,
              width: 250,
              image: AssetImage(
                "images/Dice$dicenumber.png",
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: ElevatedButton(
              child: Text(
                "Tap",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 20),
              ),
              style: ElevatedButton.styleFrom(
                  primary: Colors.lightGreenAccent.shade400,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9)),
                  padding: EdgeInsets.fromLTRB(70, 20, 70, 20)),
              onPressed: () {
                setState(() {
                  dicenumber = Random().nextInt(6) + 1;
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
