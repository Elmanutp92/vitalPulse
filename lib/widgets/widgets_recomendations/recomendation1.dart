import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:vital_pulse/db/services/get_user_info.dart';
import 'package:vital_pulse/provider/user_data_provider.dart';

import 'package:vital_pulse/styles/colors.dart';
import 'package:vital_pulse/styles/responsive_size.dart';

class Recomendation1 extends StatefulWidget {
  const Recomendation1({super.key});

  @override
  State<Recomendation1> createState() => _Recomendation1State();
}

class _Recomendation1State extends State<Recomendation1> {
  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);
    double dw = responsive.width;
    double dh = responsive.height;
    double dg = responsive.diagonal;
    return Consumer<UserDataProvider>(
      builder: (context, userDataProvider, child) {
        final userId = userDataProvider.userId;

        return FutureBuilder<List>(
          future: getUserInfo(userId),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // Muestra un indicador de carga mientras se obtienen los datos.
              return const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Espera, estamos cargando tus datos...'),
                    CircularProgressIndicator(),
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              // Maneja errores si los hay.
              return const  Center(
                child: Text('Error al cargar los datos.'),
              );
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              // Maneja el caso en que no haya datos disponibles.
              return const Center(
                child: Text('No hay datos disponibles.'),
              );
            } else {
              final data = snapshot.data!;
              final name = data[0]['nombre'].toString();

              return Scaffold(
                body: Column(
                  children: [
                    Container(
                      width: dw,
                      height: dh * 0.45,
                      margin: EdgeInsets.zero,
                      child: Stack(
                        children: [
                          Center(
                            child: Container(
                              width: dw * 0.67,
                              height: dh * 0.67,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: azulTuquesa,
                              ),
                            ),
                          ),
                          Positioned(
                            left: dw * 0.23,
                            child: Image.asset(
                              'assets/logoRecomendation1.png',
                              width: dw * 0.5,
                              height: dh * 0.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      '¡Hola $name!',
                      style: GoogleFonts.montserrat(
                        fontSize: dg * 0.04,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: dh * 0.02),
                    SizedBox(
                      width: dw * 0.9,
                      child: Text(
                        'Vamos a iniciar el registro de presión arterial, dos veces al día (mañana y tarde), por 7 días. ',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                          fontSize: dg * 0.025,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(height: dh * 0.04),
                    SizedBox(
                      width: dw * 0.9,
                      child: Text(
                        'Debes tener a la mano tu tensiómetro digital, adecuadamente calibrado ',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                          fontSize: dg * 0.025,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        );
      },
    );
  }
}
