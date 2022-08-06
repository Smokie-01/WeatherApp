import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Center(child: Text("Dice")),
          backgroundColor: Colors.purple,
        ),
        body: DicePage(),
      ),
    ),
  ));
}

class DicePage extends StatefulWidget {
  DicePage({Key? key}) : super(key: key);

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int LDN = 4;
  int RDN = 4;
  @override
  Widget build(BuildContext context) {
    return Column(
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
              primary: Color.fromARGB(255, 244, 104, 239),
              onPrimary: Colors.teal.shade800,
              elevation: 10.0,
              padding: EdgeInsets.all(6),
              fixedSize: Size(150, 50),
              shadowColor: Colors.purple,
              textStyle: TextStyle(fontSize: 25),
              shape: StadiumBorder()),
          child: Text(
            'Tap',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 30, color: Colors.black),
          ),
          onPressed: () {
            setState(() {
              LDN = Random().nextInt(6) + 1;
              RDN = Random().nextInt(6) + 1;
            });
          },
        )
      ],
    );
  }
}
