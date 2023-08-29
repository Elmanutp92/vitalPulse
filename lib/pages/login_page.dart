import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vital_pulse/pages/data_page.dart';
import 'package:vital_pulse/styles/colors.dart';
import 'package:vital_pulse/styles/responsive_size.dart';
import 'package:vital_pulse/widgets/text_form_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);
    double dw = responsive.width;
    double dh = responsive.height;
    double dg = responsive.diagonal;

    return Scaffold(
        backgroundColor: backGroundColorApp,
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top: dh * 0.05),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                    // color: Colors.amber,
                    width: dw * 1,
                    height: dh * 0.4,
                    child: const Image(
                      image: AssetImage('assets/logoVitalPulse.png'),
                    )),
                Stack(
                  children: [
                    Text(
                      'Vital Pulse',
                      style: GoogleFonts.montserrat(
                        fontSize: dg * 0.06,
                        fontWeight: FontWeight.bold,
                        color: azulMarino,
                      ),
                    ),
                    Positioned(
                      top: 2,
                      left: 2,
                      child: Text(
                        'Vital Pulse',
                        style: GoogleFonts.montserrat(
                          fontSize: dg * 0.06,
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                              .withOpacity(0.3), // Color de la sombra
                        ),
                      ),
                    ),
                  ],
                ),
                TextFormFieldApp(
                  isPassword: false,
                  obscureText: false,
                  labelText: 'Correo',
                  hintText: 'Ingrese su correo',
                  //prefixIcon:  Icon(Icons.email),
                ),
                TextFormFieldApp(
                  isPassword: true,
                  obscureText: true,
                  labelText: 'Contraseña',
                  hintText: 'Ingrese su contraseña',
                  // prefixIcon:  Icon(Icons.lock),
                ),
                Text(
                  '¿Olvidaste tu contraseña?',
                  style: GoogleFonts.montserrat(
                    fontSize: dg * 0.02,
                    color: azulMarino,
                  ),
                ),
                SizedBox(
                  height: dh * 0.04,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: azulTuquesa,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: EdgeInsets.symmetric(
                          vertical: dh * 0.02, horizontal: dw * 0.17),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const DataPage()),
                      );
                    },
                    child: Text(
                      'Entrar',
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.bold,
                          fontSize: dg * 0.02,
                          color: Colors.white),
                    ))
              ],
            ),
          ),
        ));
  }
}
