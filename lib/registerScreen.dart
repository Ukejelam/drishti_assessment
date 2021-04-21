import 'package:flutter/material.dart';
import 'main.dart';
import 'openingScreen.dart';
import 'components.dart';
import 'homeScreen.dart';
import 'loginScreen.dart';
import 'messageScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class registerScreen extends StatefulWidget {
  @override
  _registerScreenState createState() => _registerScreenState();
}

class _registerScreenState extends State<registerScreen> {

  final _auth = FirebaseAuth.instance;
  String email;
  String password;
  String fullName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Register'),),
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
                      hintText: 'Enter your Full Name',
                    ),
                    onChanged: (value){
                      fullName = value;
                    },
                  ),
                ),
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
                  title: 'Register',
                  colour: Colors.lightBlueAccent,
                  onPressed: () async{
                    try {
                      final newUser = await _auth
                          .createUserWithEmailAndPassword(
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
