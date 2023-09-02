import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vital_pulse/styles/colors.dart';
import 'package:vital_pulse/styles/responsive_size.dart';

class Recomendation3 extends StatefulWidget {
  const Recomendation3({super.key});

  @override
  State<Recomendation3> createState() => _Recomendation3State();
}

class _Recomendation3State extends State<Recomendation3> {
  @override
  Widget build(BuildContext context) {
  Responsive  responsive = Responsive(context);
    double dw = responsive.width;
    double dh = responsive.height;
    double dg = responsive.diagonal;
    return  Scaffold(
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
                top: dh * -0.17,
                left: dw * 0.10,
                child: Image.asset(
                  'assets/logoDataPage.png',
                  width: dw * 0.8,
                  height: dh * 0.8,
                  
                ),
              ),
            ]),
          ),
          SizedBox(height: dh * 0.04),
          SizedBox(
            //color: Colors.amber,
            width: dw * 0.9,
            child:  Text('Debes realizar dos (2) lecturas separadas en intervalo de dos(2) minutos', 
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