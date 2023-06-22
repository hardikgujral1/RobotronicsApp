import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'Widget.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyDCNAf4fhf4igDyLdZ0tzjJF-L7ZCZ6mJ0",
          appId: "1:61600133813:android:8bec702c7fb99d86ac84fc",
          messagingSenderId:
              "61600133813-kuvcc3ankt1ns8126hmu7hh5tm746ult.apps.googleusercontent.com",
          projectId: "finalapp-1be32"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WidgetTree(),
    );
  }
}
