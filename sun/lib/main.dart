import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          backgroundColor: Colors.greenAccent,
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(child: Text("I am Sun ")),
          ),
        ),
        body: Center(
          child: Image(
            image: AssetImage('images/sun2.png'),
          ),
        ),
      ),
    ),
  );
}
