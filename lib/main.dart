import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:vital_pulse/firebase_options.dart';
import 'package:vital_pulse/pages/login_page.dart';

void main() async {
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
   runApp(const MyApp());}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home:  LoginPage()
    );
  }
}