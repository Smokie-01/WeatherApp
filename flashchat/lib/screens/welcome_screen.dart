import 'package:flashchat/components/rounded_button.dart';
import 'package:flashchat/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'registration_screen.dart';

class WelcomeScreen extends StatefulWidget {
  static String welcomeid = "welcome_screen";
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;
  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        upperBound: 1,
        vsync:
            this, // this means the current context will provide the ticker , ticker is timer !
        duration: Duration(seconds: 1));

    controller.forward();
    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(controller);

    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: "logo",
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60,
                  ),
                ),
                Text(
                  "Flash Chat",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 50.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              color: Colors.lightBlueAccent,
              text: "Log In",
              onpressed: () {
                Navigator.pushNamed(context, LoginScreen.loginid);
              },
            ),
            RoundedButton(
              color: Colors.blueAccent,
              text: "Register",
              onpressed: () {
                Navigator.pushNamed(context, RegistrationScreen.registerid);
              },
            ),
          ],
        ),
      ),
    );
  }
}
