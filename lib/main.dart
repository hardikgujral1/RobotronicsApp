import 'package:flutter/material.dart';
import 'package:robotics/Home_Page.dart';
import 'package:flutter/services.dart';

void main() {
  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  runApp(const Robotronics_App());
}

class Robotronics_App extends StatelessWidget {
  const Robotronics_App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login_Page(),
    );
  }
}

class Login_Page extends StatefulWidget {
  const Login_Page({super.key});

  @override
  State<Login_Page> createState() => _Login_PageState();
}

class _Login_PageState extends State<Login_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
          top: MediaQuery.of(context).size.height * 0.3,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Login:",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  color: Colors.black),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              decoration: InputDecoration(
                hintStyle:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                fillColor: Colors.grey.shade400,
                filled: true,
                hintText: "User",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                suffixIcon: IconButton(
                    onPressed: () {
                      opendialog();
                    },
                    icon: Icon(
                      Icons.arrow_drop_down,
                      size: 35,
                    )),
                suffixIconColor: Colors.black,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              decoration: InputDecoration(
                hintStyle:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                fillColor: Colors.grey.shade400,
                filled: true,
                hintText: "Email",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                prefixIcon: Icon(Icons.email),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                  hintStyle: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                  fillColor: Colors.grey.shade400,
                  filled: true,
                  hintText: "Password",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)),
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: IconButton(
                      onPressed: () {}, icon: Icon(Icons.remove_red_eye))),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement((context),
                    MaterialPageRoute(builder: (context) => Home_Page()));
              },
              child: Text(
                "Login",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  backgroundColor: Colors.cyan[300]),
            ),
          ],
        ),
      ),
    );
  }

  Future opendialog() => showDialog(
      context: context,
      builder: (context) => AlertDialog(
              content: Column(
            children: [
              TextButton(
                onPressed: () {},
                child: Text(
                  "Admin",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Core Member",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black),
                ),
              ),
            ],
          )));
}
