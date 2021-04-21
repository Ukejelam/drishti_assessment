import 'package:flutter/material.dart';
import 'main.dart';
import 'openingScreen.dart';
import 'components.dart';
import 'registerScreen.dart';
import 'homeScreen.dart';
import 'messageScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class loginScreen extends StatefulWidget {
  @override
  _loginScreenState createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  final _auth = FirebaseAuth.instance;

  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Log in'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your email',
                ),
                onChanged: (value){
                  email = value;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your password',
                ),
                onChanged: (value){
                  password = value;
                },
              ),
            ),
            RoundedButton(
              title: 'Log In',
              colour: Colors.lightBlueAccent,
              onPressed: () async{
                try {
                  final newUser = await _auth
                      .signInWithEmailAndPassword(
                      email: email, password: password);
                  if(newUser != null){
                    Navigator.pushNamed(context, "homeScreen");
                  }
                } catch(e){
                  print(e);
                }
              },
            ),
          ],
        )
      )
    );
  }
}

