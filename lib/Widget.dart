import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_login/homepage2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';

import 'RoleBased/CoreMember.dart';
import 'RoleBased/mentor.dart';
import 'auth.dart';
import 'home_page.dart';
import 'loginPage.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          //login completed
          route();
          return CircularProgressIndicator();
        } else {
          return LoginPage();
        }
      },
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
