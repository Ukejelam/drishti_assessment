import 'package:flutter/material.dart';
import 'homeScreen.dart';
import 'openingScreen.dart';
import 'components.dart';
import 'registerScreen.dart';
import 'loginScreen.dart';
import 'messageScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    title: 'Main',
    initialRoute: "openingScreen",
    routes: {
      "openingScreen": (context) => openingScreen(),
      "loginScreen": (context) => loginScreen(),
      "registerScreen": (context) => registerScreen(),
      "homeScreen": (context) => homeScreen(),
      "messageScreen": (context) => messageScreen(),
    },
  ));
}