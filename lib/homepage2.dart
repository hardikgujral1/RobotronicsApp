import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_login/RoleBased/CoreMember.dart';
import 'package:final_login/RoleBased/mentor.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Homepage2 extends StatefulWidget {
  const Homepage2({super.key});

  @override
  State<Homepage2> createState() => _Homepage2State();
}

class _Homepage2State extends State<Homepage2> {
  final user = FirebaseAuth.instance.currentUser!;

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  Widget _title() {
    return const Text("Firebase Authenticaton");
  }

  Widget _signOutButton() {
    return ElevatedButton(onPressed: signOut, child: const Text("SignOut!"));
  }

  Widget _userId() {
    return Text(user.email ?? "User_email");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    route();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _userId(),
            _signOutButton(),
          ],
        ),
      ),
    );
  }

  void route() {
    User? user = FirebaseAuth.instance.currentUser;
    var kk = FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        if (documentSnapshot.get('Role') == "Mentor") {
          print("Mentor");
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Mentor(),
            ),
          );
        } else {
          print("Core Member");
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => CoreMember(),
            ),
          );
        }
      } else {
        print('Document does not exist on the database');
      }
    });
  }
}
