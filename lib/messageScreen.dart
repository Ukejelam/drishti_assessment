import 'package:flutter/material.dart';
import 'main.dart';
import 'openingScreen.dart';
import 'components.dart';
import 'registerScreen.dart';
import 'loginScreen.dart';
import 'homeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class messageScreen extends StatefulWidget {
  User xyz;
  messageScreen({this.xyz});

  @override
  _messageScreenState createState() => _messageScreenState();
}

class _messageScreenState extends State<messageScreen> {
  final _firestore = FirebaseFirestore.instance;
  String message;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Upload content'),
        ),
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: TextField(
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Upload Content',
                      ),
                      onChanged: (value) {
                        message = value;
                      },
                    )),
                RoundedButton(
                  title: "Upload",
                  colour: Colors.lightBlueAccent,
                  onPressed: () {
                    _firestore.collection("messages").add({"message" : message, "sender" : widget.xyz.email});
                    Navigator.pop(context);
                  },
                ),
              ]),
        ));
  }
}
