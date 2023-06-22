import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'RoleBased/CoreMember.dart';
import 'RoleBased/mentor.dart';
import 'auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? errorMessage = "";
  bool isLogin = true;
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  Future<void> signInWithEmailandPassword() async {
    try {
      await Auth().signInWithEmailAndPassword(
        email: _controllerEmail.text,
        password: _controllerPassword.text,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
        showSnackBar(context, errorMessage as String);
      });
    }
    ;
  }

  Future<void> createUserWithEmailAndPassword() async {
    try {
      await Auth().createUserWithEmailAndPassword(
          email: _controllerEmail.text, password: _controllerPassword);
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
        showSnackBar(context, errorMessage as String);
      });
    }
    ;
  }

  Widget _title() {
    return const Text("Robotronics APP Auth");
  }

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2),
      ),
    );
  }

  Widget submitButton() {
    return ElevatedButton(
      onPressed:
          isLogin ? signInWithEmailandPassword : createUserWithEmailAndPassword,
      child: Text(isLogin ? "Login" : "Register"),
    );
  }

  Widget _loginOrRegisterButton() {
    return TextButton(
        onPressed: () {
          setState(() {
            isLogin != isLogin;
          });
        },
        child:
            Text(isLogin ? "For ID Contact Administrator " : "Please Login"));
  }

  Widget _entryField(
    String title,
    TextEditingController controller,
  ) {
    return TextField(
        controller: controller, decoration: InputDecoration(labelText: title));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Column(children: [
              SizedBox(
                height: 220,
              ),
              SizedBox(
                  child: Container(
                alignment: Alignment.topLeft,
                child: const Text(
                  "Log in:",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 48),
                ),
              )),
              SizedBox(height: 40),
              SizedBox(
                height: 45,
                child: TextField(
                  controller: _controllerEmail,
                  decoration: InputDecoration(
                    labelText: 'Email ',
                    labelStyle: TextStyle(
                      color: Colors.white,
                    ),
                    filled: true,
                    fillColor: Color.fromARGB(97, 217, 217, 217),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(27),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              SizedBox(
                height: 45,
                child: TextField(
                  controller: _controllerPassword,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.white),
                    filled: true,
                    fillColor: Color.fromARGB(97, 217, 217, 217),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(27),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                  child: TextButton(
                onPressed: () {},
                child: Text("Forgot Your Password",
                    style:
                        TextStyle(color: Color.fromARGB(179, 255, 255, 255))),
              )),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                  height: 57,
                  width: 250,
                  child: ElevatedButton(
                      child: Text(
                        'Enter',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 217, 217, 217),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(27)),
                      ),
                      onPressed: () {
                        if (isLogin == true) {
                          signInWithEmailandPassword();
                        } else {
                          createUserWithEmailAndPassword();
                        }
                      }

                      // Add login functionality here

                      )),
            ]),
          ),
        ),
      ),
    );
  }
}
