import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vital_pulse/styles/colors.dart';
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
    return Scaffold(
      body: Column(
        children: [
          Container(
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
          const Spacer(),
          Container(
            margin: EdgeInsets.only(bottom: dh * 0.04),
            //color: Colors.amber,
            child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all<double>(8),
                  minimumSize: MaterialStateProperty.all<Size>(
                      Size(dw * 0.2, dh * 0.06)),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(azulTuquesa),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(19.0),
                    ),
                  ),
                ),
                child: Text(
                  'Empecemos',
                  style: GoogleFonts.montserrat(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
