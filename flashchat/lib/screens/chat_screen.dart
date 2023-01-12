import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _fireStore = FirebaseFirestore.instance;
late User LoggedInUser;

class ChatScreen extends StatefulWidget {
  static String chatid = "chat_screen";
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late String messages;
  final messageController = TextEditingController();
  final _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        LoggedInUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                Navigator.pop(context);
              }),
        ],
        title: Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            MessageStream(),
            //stream : means from where the data come from
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: messageController,
                      onChanged: (value) {
                        messages = value;
                      },
                      decoration: KtextfieldDecoration.copyWith(
                          hintText: 'type your message here....'),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      messageController.clear();
                      _fireStore.collection('messages').add(
                          {"text": messages, "sender": LoggedInUser.email});
                    },
                    icon: const Icon(
                      Icons.send,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}

class MessageStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _fireStore.collection('messages').snapshots(),
        builder: (BuildContext context, snapshot) {
          if (!snapshot.hasData) {
            CircularProgressIndicator(
              backgroundColor: Colors.blue,
            );
          }
          final messages = snapshot.data?.docs.reversed;
          List<Widget> messageStyle = [];
          for (var message in messages!) {
            final messageSender = message.get('sender');
            final messageText = message.get('text');
            final currentUser = LoggedInUser.email;

            final messageWidget = MessageStyle(
                sender: messageSender,
                text: messageText,
                isMe: currentUser == messageSender);

            messageStyle.add(messageWidget);
          }
          return Expanded(
            child: ListView(
              reverse: true,
              children: messageStyle,
            ),
          );
        });
  }
}

class MessageStyle extends StatelessWidget {
  MessageStyle({required this.sender, required this.text, required this.isMe});
  final String sender;
  final String text;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(sender),
          Material(
              borderRadius: BorderRadius.only(
                  topLeft: isMe ? Radius.circular(30) : Radius.circular(0),
                  topRight: isMe ? Radius.circular(0) : Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)),
              elevation: 5.0,
              color: isMe ? Colors.lightBlueAccent : Colors.white,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  text,
                  style: TextStyle(
                      fontSize: 17, color: isMe ? Colors.white : Colors.black),
                ),
              )),
        ],
      ),
    );
  }
}
