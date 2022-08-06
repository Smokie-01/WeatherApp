import 'dart:io';

import 'package:flutter/material.dart';

//the main function is the starting point for our flutter app.
void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blueGrey[400],
        appBar: AppBar(
          backgroundColor: Colors.blueGrey[900],
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text('i am moon'),
            ),
          ),
        ),
        body: const Center(
          child: Image(
            image: AssetImage('images/moon.jpg'),
          ),
        ),
      ),
    ),
  );
}
