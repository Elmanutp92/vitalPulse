import 'package:flutter/material.dart';
import 'package:vital_pulse/styles/colors.dart';
import 'package:vital_pulse/styles/responsive_size.dart';

class Recomendation2 extends StatefulWidget {
  const Recomendation2({super.key});

  @override
  State<Recomendation2> createState() => _Recomendation2State();
}

class _Recomendation2State extends State<Recomendation2> {
  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);
    double dw = responsive.width;
    double dh = responsive.height;
    //double dg = responsive.diagonal;
    return  Scaffold(
      body: Container(
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
            left: dw * 0.12,
            child: Image.asset(
              'assets/logoRecomendation2.png',
              width: dw * 0.8,
              height: dh * 0.8,
              
            ),
          ),
        ]),
      ),
    );
  }
}