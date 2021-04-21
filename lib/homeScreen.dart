import 'package:flutter/material.dart';
import 'main.dart';
import 'openingScreen.dart';
import 'components.dart';
import 'registerScreen.dart';
import 'loginScreen.dart';
import 'messageScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class homeScreen extends StatefulWidget {
  @override
  _homeScreenState createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  ShapeBorder x = RoundedRectangleBorder();
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  User loggedInUser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  // void getMessages() async {
  // final messages = await _firestore.collection("messages").get().then((querySnapshot){
  // querySnapshot.docs.forEach((result) {
  //  print(result.data());
  // });
  // });
  // }

  void messagesStream() async {
    await for (var snapshot in _firestore.collection("messages").snapshots()) {
      for (var message in snapshot.docs) {
        print(message.data);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Twitter Style App"),
      ),
      drawer: Drawer(
        child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text('Drawer'),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
              ListTile(
                title: Text('Profile'),
                onTap: () {
                },
              ),
              ListTile(
                title: Text('Sign Out'),
                onTap: () {
                  _auth.signOut();
                  Navigator.pop(context);
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
              ),
            ]),
      ),
      body: SafeArea(
        child: Column(
          children: [
            StreamBuilder<QuerySnapshot>(
                stream: _firestore.collection("messages").snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) return Text('loading ...');
                  return Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.all(8.0),
                        itemExtent: 80,
                        itemCount: snapshot.data.docs.length,
                        itemBuilder: (context, index) {
                          return Card(
                            color: Colors.grey[300],
                            child: ListTile(
                              shape: x,
                              dense: true,
                              contentPadding: EdgeInsets.all(9.0),
                              title: Text(snapshot.data.docs[index]['sender']),
                                subtitle: Text(snapshot.data.docs[index]['message'])),
                          );
                        }),
                  );
                }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => messageScreen(xyz: loggedInUser),
            ),
          );
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.lightBlue,
      ),
    );
  }
}
