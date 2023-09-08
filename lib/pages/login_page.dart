import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:vital_pulse/auth/login.dart';

import 'package:vital_pulse/auth/register.dart';

import 'package:vital_pulse/styles/colors.dart';
import 'package:vital_pulse/styles/responsive_size.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  bool obscureText = true;
  bool isLoaging = false;
  String? userId = '';

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controllerEmail.dispose();
    _controllerPassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        setState(() {
          userId = user.uid;
        });
        print(userId);
      }
    

    Responsive responsive = Responsive(context);
    double dw = responsive.width;
    double dh = responsive.height;
    double dg = responsive.diagonal;

    return Scaffold(
        backgroundColor: backGroundColorApp,
        body: Stack(children: [
          if (isLoaging)
            Positioned.fill(
              child: Container(
                color: backGroundColorApp.withOpacity(0.5),
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Cargando...',
                        style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.bold,
                            fontSize: dg * 0.02,
                            color: azulMedianoche)),
                    const LoadingIndicator(
                        indicatorType: Indicator.ballScaleMultiple,

                        /// Required, The loading type of the widget
                        colors: [azulTuquesa, azulMedianoche],

                        /// Optional, The color collections
                        //strokeWidth: 2,

                        /// Optional, The stroke of the line, only applicable to widget which contains line
                        backgroundColor: backGroundColorApp,

                        /// Optional, Background of the widget
                        pathBackgroundColor: backGroundColorApp

                        /// Optional, the stroke backgroundColor
                        ),
                  ],
                )),
              ),
            ),
          if (!isLoaging)
            SingleChildScrollView(
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
                    Form(
                        key: _globalKey,
                        child: Column(
                          children: [
                            Container(
                              height: dh * 0.11,
                              width: dw * 0.95,
                              //margin:  EdgeInsets.only(
                              //left: dw * 0.03 , right: dw * 0.03, top: dh * 0.03),
                              child: Column(
                                children: [
                                  TextFormField(
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Por favor ingrese un valor';
                                      } else if (!value.contains('@')) {
                                        return 'Por favor ingrese un correo valido';
                                      } else if (!value.contains('.com')) {
                                        return 'Por favor ingrese un correo valido';
                                      } else if (value.contains(' ')) {
                                        return 'Por favor ingrese un correo valido';
                                      }
                                      return null;
                                    },
                                    controller: _controllerEmail,
                                    decoration: InputDecoration(
                                      fillColor: Colors
                                          .white, // Color de fondo del campo
                                      filled:
                                          true, // Habilitar el relleno de color
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      labelText: 'Correo',
                                      errorStyle: const TextStyle(
                                        color: Colors.red,
                                        // Ajusta el tamaño de la etiqueta
                                        // Puedes ajustar el peso de la etiqueta
                                      ),
                                      hintText: 'Ingrese su correo',

                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: dh *
                                              0.02, // Ajusta el espacio vertical dentro del TextFormField
                                          horizontal: dw *
                                              0.03 // Espacio horizontal constante
                                          ),
                                      labelStyle: TextStyle(
                                        color: azulMarino,
                                        fontSize: dg *
                                            0.02, // Ajusta el tamaño de la etiqueta
                                        // Puedes ajustar el peso de la etiqueta
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: dh * 0.12,
                              width: dw * 0.95,
                              //margin:  EdgeInsets.only(
                              // left: dw * 0.03 , right: dw * 0.03, bottom: dh * 0.03),
                              child: Column(
                                children: [
                                  TextFormField(
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Por favor ingrese un valor';
                                      } else if (value.length < 6) {
                                        return 'La contraseña debe tener al menos 6 caracteres';
                                      } else if (value.contains(' ')) {
                                        return 'La contraseña no puede contener espacios';
                                      }
                                      return null;
                                    },
                                    controller: _controllerPassword,
                                    obscureText: obscureText,
                                    decoration: InputDecoration(
                                      fillColor: Colors
                                          .white, // Color de fondo del campo
                                      filled:
                                          true, // Habilitar el relleno de color
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      labelText: 'Contraseña',
                                      errorStyle: const TextStyle(
                                        color: Colors.red,
                                        // Ajusta el tamaño de la etiqueta
                                        // Puedes ajustar el peso de la etiqueta
                                      ),

                                      hintText: 'Ingrese su contraseña',

                                      suffixIcon: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            obscureText = !obscureText;
                                          });
                                        },
                                        icon: Icon(obscureText
                                            ? Icons.visibility_off
                                            : Icons.visibility),
                                      ),

                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: dh *
                                              0.02, // Ajusta el espacio vertical dentro del TextFormField
                                          horizontal: dw *
                                              0.03 // Espacio horizontal constante
                                          ),
                                      labelStyle: TextStyle(
                                        color: azulMarino,
                                        fontSize: dg *
                                            0.02, // Ajusta el tamaño de la etiqueta
                                        // Puedes ajustar el peso de la etiqueta
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        )),
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
                          elevation: 8,
                          backgroundColor: azulTuquesa,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: EdgeInsets.symmetric(
                              vertical: dh * 0.02, horizontal: dw * 0.17),
                        ),
                        onPressed: () async {
                          setState(() {
                            isLoaging = true;
                          });
                          if (_globalKey.currentState!.validate()) {
                            await login(_controllerEmail.text,
                                _controllerPassword.text, context);
                          }
                          setState(() {
                            isLoaging = false;
                          });
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
            ),
        ]));
  }
}
