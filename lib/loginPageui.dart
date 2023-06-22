import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: LoginScreen(),
      ),
    );
  }
}

class LoginScreen extends StatelessWidget {
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
                      onPressed: () {
                        // Add login functionality here
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 217, 217, 217),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(27)),
                      ))),
            ]),
          ),
        ),
      ),
    );
  }
}
