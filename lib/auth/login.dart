import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vital_pulse/auth/register.dart';
import 'package:vital_pulse/pages/home_page.dart';
import 'package:vital_pulse/styles/responsive_size.dart';

Future<bool> login(String email, String password, context) async {
  Responsive responsive = Responsive(context);
  double dg = responsive.diagonal;
  try {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    if (credential.user != null) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.green,
          content: Text(
            '¡Bienvenido!',
            style: GoogleFonts.montserrat(
              color: Colors.white,
              fontSize: dg * 0.015,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
    }

    return true;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      // Si no se encuentra un usuario con ese correo electrónico, redirige a la página de registro.
      await register(email, password, context);

     //print(
         // 'No se encontró un usuario con ese correo electrónico. Se ha registrado un nuevo usuario.');
    } else if (e.code == 'wrong-password') {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            'Contraseña incorrecta para ese usuario.',
            style: GoogleFonts.montserrat(
              color: Colors.white,
              fontSize: dg * 0.015,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
    //  print('Contraseña incorrecta para ese usuario.');
    }
    return false; // Debes devolver false en caso de error.
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        content: Text(
          'Error durante el inicio de sesión: $e',
          style: GoogleFonts.montserrat(
            color: Colors.white,
            fontSize: dg * 0.015,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
    //print('Error durante el inicio de sesión: $e');
    return false; // También debes devolver false en caso de error.
  }
}
