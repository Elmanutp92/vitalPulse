


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vital_pulse/pages/login_page.dart';

Future<bool> singOut (context) async {
  try {
    await FirebaseAuth.instance.signOut();
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const LoginPage()));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.green,
        content: Text('Sesión cerrada con éxito',
            style: GoogleFonts.montserrat(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold)),
      ),
    );
    return true;
  } catch (e) {
    // Handle specific Firebase Auth errors
    if (e is FirebaseAuthException) {
      print(e.message);
    }
    return false;
  }
}