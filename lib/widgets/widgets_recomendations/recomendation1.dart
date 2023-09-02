import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
    return Scaffold(
      body: Column(
        children: [
          Container(
            //color: Colors.amber,
            width: dw, 
            height: dh * 0.45,
            margin: EdgeInsets.zero,
            child: Stack(children: [
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
            ]),
          ),
          Text('¡Hola Marta!', style: GoogleFonts.montserrat(
            fontSize: dg * 0.04,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),),
          SizedBox(height: dh * 0.02), 
          SizedBox(
            //color: Colors.amber,
            width: dw * 0.9,
            child:  Text('Vamos a iniciar el registro de presión arterial, dos veces al día (mañana y tarde), por 7 dias. ', 
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
              fontSize: dg * 0.03,
              //fontWeight: FontWeight.w600,
              color: Colors.black,
            ),),
          ),
          SizedBox(height: dh * 0.02), 
          SizedBox(
            //color: Colors.amber,
            width: dw * 0.9,
            child:  Text('Debes tener a la mano tu tensiómetro digital,  adecuadamente calibrado ', 
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
              fontSize: dg * 0.03,
              //fontWeight: FontWeight.w600,
              color: Colors.black,
            ),),
          ),
        ],
      ),
    );
  }
}
