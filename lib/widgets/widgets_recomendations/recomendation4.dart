import 'package:flutter/material.dart';
import 'package:vital_pulse/styles/responsive_size.dart';

class Recomendation4 extends StatefulWidget {
  const Recomendation4({super.key});

  @override
  State<Recomendation4> createState() => _Recomendation4State();
}

class _Recomendation4State extends State<Recomendation4> {
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
         
          Positioned(
            top: dh * -0.17,
            left: dw * 0.12,
            child: Image.asset(
              'assets/logoVitalPulse.png',
              width: dw * 0.8,
              height: dh * 0.8,
              
            ),
          ),
        ]),
      ),
    );
  }
}