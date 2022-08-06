import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const XylophoneApp());
}

class XylophoneApp extends StatefulWidget {
  const XylophoneApp({Key? key}) : super(key: key);

  @override
  State<XylophoneApp> createState() => _XylophoneAppState();
}

class _XylophoneAppState extends State<XylophoneApp> {
  void playsound(int notenumber) {
    final player = AudioCache();
    player.play('assets_note$notenumber.wav');
  }

  Expanded buildkey({required Color colors, required int notenumber}) {
    return Expanded(
      child: ElevatedButton(
        child: Text(""),
        style: ElevatedButton.styleFrom(
          primary: colors,
        ),
        onPressed: () {
          playsound(notenumber);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildkey(
                colors: Colors.purple,
                notenumber: 1,
              ),
              buildkey(
                colors: Colors.indigo,
                notenumber: 2,
              ),
              buildkey(
                colors: Colors.blue,
                notenumber: 3,
              ),
              buildkey(
                colors: Colors.green,
                notenumber: 4,
              ),
              buildkey(
                colors: Colors.yellow,
                notenumber: 5,
              ),
              buildkey(
                colors: Colors.orange,
                notenumber: 6,
              ),
              buildkey(
                colors: Colors.red,
                notenumber: 7,
              )
            ],
          ),
        ),
      ),
    );
  }
}
