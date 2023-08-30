import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vital_pulse/pages/recomendation_page.dart';
import 'package:vital_pulse/styles/colors.dart';
import 'package:vital_pulse/styles/responsive_size.dart';


class QuestionsPage extends StatefulWidget {
  const QuestionsPage({super.key});

  @override
  State<QuestionsPage> createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage> {
  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);
    double dw = responsive.width;
    double dh = responsive.height;
    double dg = responsive.diagonal;

    return Scaffold(
      backgroundColor: backGroundColorApp,
      body: Container(
        // color: Colors.amber,
        width: dw,
        height: dh,
        margin: EdgeInsets.zero,
        child: Stack(children: [
          Positioned(
            top: dh * -0.20,
            left: dw * 0.10,
            child: Image.asset(
              'assets/logoDataPage.png',
              width: dw * 0.8,
              height: dh * 0.8,
            ),
          ),
          Positioned(
            top: dh * 0.3,
            left: dw * 0.05,
            child: Container(
              width: dw * 0.9,
              //color: Colors.amber,
              child: Text(
                '¿Por que te gustaria monitorear tu presion arterial?',
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                  fontSize: dg * 0.03,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Positioned(
            top: dh * 0.49,
            child: Container(
              width: dw,
              height: dh * 0.48,
              //color: Colors.amber,
              child: Column(
                children: [
                  SizedBox(
                    width: dw * 0.9,
                    height: dh * 0.06,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(azulClaro),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ))),
                        onPressed: () {
                           Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const RecommendationPage()));
                        },
                        child: Text('Quiero ser mas saludable', style: GoogleFonts.montserrat(
                  fontSize: dg * 0.020,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                        )),
                  ),),
                  SizedBox(height: dh * 0.02,),
                  SizedBox(
                    width: dw * 0.9,
                    height: dh * 0.06,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(azulClaro),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ))),
                        onPressed: () {
                          Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const RecommendationPage()));
                        },
                        child: Text('Tengo presión arterial alta ', style: GoogleFonts.montserrat(
                  fontSize: dg * 0.020,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                        )),),
                  ),
                  SizedBox(height: dh * 0.02,),

                  SizedBox(
                    width: dw * 0.9,
                    height: dh * 0.06,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(azulClaro),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ))),
                        onPressed: () {
                          Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const RecommendationPage()));
                        },
                        child: Text('Mi doctor me ordenó un registro', style: GoogleFonts.montserrat(
                  fontSize: dg * 0.018,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                        )),),
                  ),
                  SizedBox(height: dh * 0.02,),

                  SizedBox(
                    width: dw * 0.9,
                    height: dh * 0.06,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(azulClaro),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ))),
                        onPressed: () {
                          Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const RecommendationPage()));
                        },
                        child: Text('Monitoreo de rutina', style: GoogleFonts.montserrat(
                  fontSize: dg * 0.020,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                        )),),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
