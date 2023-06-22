import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../welcome2.dart';

class Mentor extends StatefulWidget {
  const Mentor({super.key});

  @override
  State<Mentor> createState() => _MentorState();
}

class _MentorState extends State<Mentor> {
  final user = FirebaseAuth.instance.currentUser!;

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  Widget _signOutButton() {
    return ElevatedButton(
        onPressed: () {
          signOut();
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Welcome()),
          );
        },
        child: const Text("SignOut!"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mentor"),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _signOutButton(),
          ],
        ),
      ),
    );
  }
}
