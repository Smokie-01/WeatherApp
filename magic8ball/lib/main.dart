import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Magic8ball(),
      appBar: AppBar(
        title: Text("Ask me Anything"),
      ),
    ),
  ));
}

class Magic8ball extends StatefulWidget {
  const Magic8ball({Key? key}) : super(key: key);

  @override
  State<Magic8ball> createState() => _Magic8ballState();
}

class _Magic8ballState extends State<Magic8ball> {
  int balldicenumber = 5;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    balldicenumber = Random().nextInt(5) + 1;
                  });
                },
                child:
                    Image(image: AssetImage("images/ball$balldicenumber.png"))))
      ],
    );
  }
}
