import 'package:destini/story_Brain.dart';
import 'package:flutter/material.dart';
import 'story_Brain.dart';

void main() {
  runApp(const MyApp());
}

StoryBrain brain = StoryBrain();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        body: HomePage(),
        appBar: AppBar(
          title: Center(
            child: Text(
              'Destini',
              style: TextStyle(
                  fontFamily: "PatrickHandSC",
                  fontSize: 40,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void nextStory(int userchoice, int _storyNumber) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('images/photo.jpg'), fit: BoxFit.cover),
      ),
      constraints: BoxConstraints.expand(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Center(
              child: Text(
                brain.getstory(),
                style: TextStyle(
                    fontSize: 29,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: "PatrickHandSC"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    elevation: 4.0,
                    primary: Colors.red,
                    fixedSize: Size(0, 50),
                    textStyle:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                onPressed: () {
                  setState(() {
                    brain.nextStory(1);
                  });
                },
                child: Text(brain.getchoice1())),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 25),
            child: Visibility(
              visible: brain.buttonShouldVisible(),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      elevation: 4.0,
                      primary: Colors.blueGrey,
                      fixedSize: Size(0, 50),
                      textStyle:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  onPressed: () {
                    setState(() {
                      brain.nextStory(2);
                    });
                  },
                  child: Text(brain.getchoice2())),
            ),
          )
        ],
      ),
    );
  }
}
