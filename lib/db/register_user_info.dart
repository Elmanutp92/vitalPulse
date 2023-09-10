import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vital_pulse/pages/questions_pages.dart';

Future<void> registerUserInfo(String name, String? gender, String age,
    String weight, String stature, String? etnia, context) async {
  final userInfo = {
    'nombre': name,
    'genero': gender,
    'edad': age,
    'peso': weight,
    'talla': stature,
    'etnia': etnia,
  };

  try {
    // Obtén el userId del usuario actualmente autenticado.
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final userId = user.uid;
      //final email = user.email;

      // Crea una nueva colección en Firestore llamada "users" y agrega un documento con el userId.
       await FirebaseFirestore.instance
          .collection("users")
          .doc(userId)
          .collection('userInfo')
          .doc('_$userId') // Agregando un guion bajo delante del userId
          .set(userInfo);

      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection("users")
          .doc(userId)
          .collection('userInfo')
          .doc('_$userId')
          .get();

      if (snapshot.exists) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.green,
            content: Text(
              'Se ha registrado la información del usuario',
              style: GoogleFonts.montserrat(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const QuestionsPage()),
        );
       // print('Se ha registrado la información del usuario');
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            'Ops! Algo salió mal.',
            style: GoogleFonts.montserrat(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
      // Manejar el caso en el que no hay un usuario autenticado.
     // print('No hay un usuario autenticado.');
    }
  } catch (e) {
   // print(e);
  }
}
