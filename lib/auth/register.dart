import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vital_pulse/auth/login.dart';
import 'package:vital_pulse/pages/data_page.dart';
import 'package:vital_pulse/styles/responsive_size.dart';

Future<bool> register(String email, String password, context) async {
   Responsive responsive = Responsive(context);
    //double dw = responsive.width;
    //double dh = responsive.height;
    double dg = responsive.diagonal;
  try {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    
    // El usuario se registró con éxito

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.green,
        content: Text('Usuario registrado con éxito',
            style: GoogleFonts.montserrat(
                color: Colors.white,
                fontSize: dg * 0.015,
                fontWeight: FontWeight.bold)),
      ),
    );

    


    
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const DataPage()));
    return true;
  } catch (e) {
    // Handle specific Firebase Authentication errors
    if (e is FirebaseAuthException) {
      if (e.code == 'weak-password') {
        // Contraseña débil, notificar al usuario
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text('Contraseña débil',
                style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontSize: dg * 0.015,
                    fontWeight: FontWeight.bold)),
          ),
        );
        print('Contraseña débil');
      } else if (e.code == 'email-already-in-use') {
        // El correo electrónico ya está en uso, notificar al usuario
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text('El correo ya está en uso',
                style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontSize: dg * 0.015,
                    fontWeight: FontWeight.bold)),
          ),
        );
        print('Correo electrónico ya en uso');
      } else {
        // Otro error de Firebase Authentication, imprimir detalles para depuración
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text('Error de autenticación',
                style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontSize: dg * 0.015,
                    fontWeight: FontWeight.bold)),
          ),
        );
        print('Error de autenticación: ${e.message}');
      }
    } else {
      // Otro tipo de error, imprimir para depuración
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text('Error desconocido',
              style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontSize: dg * 0.015,
                  fontWeight: FontWeight.bold)),
        ),
      );
      print('Error desconocido: $e');
    }
    // El registro no fue exitoso
    return false;
  }
}
