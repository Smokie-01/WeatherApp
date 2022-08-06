import 'package:flutter/material.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.redAccent,
        body: SafeArea(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage('images/taufiq.jpg'),
            ),
            Text(
              "Taufiq Mulla",
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'DancingScript',
                fontSize: 35.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "FLUTTER DEVELOPER",
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Source Serif Pro',
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none,
                  color: Colors.white70,
                  letterSpacing: 5),
            ),
            SizedBox(
              width: 200,
              child: Divider(
                color: Colors.black,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: Icon(
                    Icons.phone,
                    color: Colors.black,
                  ),
                  title: Text(
                    "7719980188",
                    style: TextStyle(
                        fontFamily: 'Source Serif Pro',
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.none,
                        color: Colors.black,
                        letterSpacing: 5),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                margin: EdgeInsets.symmetric(vertical: 1, horizontal: 25.0),
                child: ListTile(
                    leading: Icon(
                      Icons.email,
                      color: Colors.black,
                    ),
                    title: Text(
                      "2002taufiqmulla@gmail.com",
                      style: TextStyle(
                          fontFamily: 'Source Serif Pro',
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.none,
                          color: Colors.black,
                          letterSpacing: 2.5),
                    )),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
