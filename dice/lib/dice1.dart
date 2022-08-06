import 'package:flutter/material.dart';

class DicePage extends StatefulWidget {
  DicePage({Key? key}) : super(key: key);

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int LDN = 5;
  int RDN = 6;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Let's Roll",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'RockSalt',
            fontSize: 50, color: Colors.red,
            // fontFamily: ,
          ),
        ),
        Row(children: [
          Expanded(
            child: Image.asset('images/Dice$LDN.png'),
          ),
        ])
      ],
    );
  }
}
