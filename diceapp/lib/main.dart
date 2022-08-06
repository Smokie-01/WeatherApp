import 'package:diceapp/dice1.dart';
import 'package:diceapp/dice2.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Dicepage(),
          appBar: AppBar(
            backgroundColor: Colors.teal,
            title: Center(child: Text("DiceApp")),
          ),
        ));
  }
}

class Dicepage extends StatefulWidget {
  const Dicepage({Key? key}) : super(key: key);

  @override
  State<Dicepage> createState() => _DicepageState();
}

class _DicepageState extends State<Dicepage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/backimg.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 6,
            child: Align(
              alignment: Alignment(-0.1, -0.56),
              child: Text(
                "No. of dice you want",
                style: TextStyle(
                    color: Colors.black, fontSize: 25, fontFamily: "Ewert"),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14)),
                ),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Dice1()));
                },
                child: Text(
                  "1 x Dice",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.amber,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14)),
                  ),
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => Dice2()));
                  },
                  child: Text(
                    "2 x Dice",
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  )),
            ),
          )
        ],
      ),
    );
  }
}
