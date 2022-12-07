import 'package:flashchat/screens/chat_screen.dart';
import 'package:flashchat/screens/login_screen.dart';
import 'package:flashchat/screens/registration_screen.dart';
import 'package:flashchat/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(FlashChat());

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: WelcomeScreen.welcomeid,
      routes: {
        WelcomeScreen.welcomeid: (context) => WelcomeScreen(),
        LoginScreen.loginid: (context) => LoginScreen(),
        RegistrationScreen.registerid: (context) => RegistrationScreen(),
        ChatScreen.chatid: (context) => ChatScreen(),
      },
    );
  }
}
