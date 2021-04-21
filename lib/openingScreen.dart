import 'package:flutter/material.dart';
import 'main.dart';
import 'homeScreen.dart';
import 'components.dart';
import 'registerScreen.dart';
import 'loginScreen.dart';
import 'messageScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class openingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Twitter Style App"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Log in or register",
              ),
              RoundedButton(
                title: 'Log In',
                colour: Colors.lightBlueAccent,
                onPressed: () {
                  Navigator.pushNamed(context, "loginScreen");
                },
              ),
              RoundedButton(
                title: 'Register',
                colour: Colors.blueAccent,
                onPressed: () {
                  Navigator.pushNamed(context, "registerScreen");
                },
              ),
            ],
          ),
        ),

      ),
    );
  }
}