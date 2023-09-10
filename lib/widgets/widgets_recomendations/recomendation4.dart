import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vital_pulse/pages/home_page.dart';

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
          SizedBox(
            //color: Colors.amber,
            width: dw * 0.8,
            child: Text(
              'Luego de completar el registro de mañana y tarde por mínimo 7 días, tendrás la clasificación de tu presión arterial y recomendaciones guiadas a tu resultado.',
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                fontSize: dg * 0.025,
                //fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
          const Spacer(),
          Container(
            width: dw * 0.44,
            height: dh * 0.07,
            margin: EdgeInsets.only(bottom: dh * 0.04),
            //color: Colors.amber,
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const  HomePage()),
                  );
                },
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all<double>(8),
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
                    fontSize: dg * 0.02,
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
