import 'package:final_login/welcome2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CoreMember extends StatefulWidget {
  const CoreMember({super.key});

  @override
  State<CoreMember> createState() => _CoreMemberState();
}

class _CoreMemberState extends State<CoreMember> {
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
        title: Text("Core Member"),
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
