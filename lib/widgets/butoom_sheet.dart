import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vital_pulse/styles/colors.dart';
import 'package:vital_pulse/styles/responsive_size.dart';

class ButoomSheet extends StatefulWidget {
  const ButoomSheet({super.key});

  @override
  State<ButoomSheet> createState() => _ButoomSheetState();
}

class _ButoomSheetState extends State<ButoomSheet> {
  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);
    double dw = responsive.width;
    double dh = responsive.height;
    double dg = responsive.diagonal;
    return IconButton(
      onPressed: () {
        showModalBottomSheet(
          backgroundColor: Colors.transparent,
          context: context,
          isScrollControlled:
              true, // Esto hace que el BottomSheet aparezca desde arriba
          builder: (context) {
            // En este builder, puedes definir el contenido del BottomSheet
            return Container(
              decoration: const BoxDecoration(
                color: azulClaro,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              height: dh * 0.8, // Ajusta la altura según tus necesidades
              child: Column(
                //mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: dh * 0.02,
                  ),
                  Container(
                    child: Text(
                      'Presión Arterial',
                      style: GoogleFonts.montserrat(
                        fontSize: dg * 0.028,
                        fontWeight: FontWeight.bold,
                        //color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: dh * 0.01,
                  ),
                  Container(
                    child: Text(
                      'Lectura # 1',
                      style: GoogleFonts.montserrat(
                        fontSize: dg * 0.025,
                        fontWeight: FontWeight.w500,
                        //color: Colors.black,
                      ),
                    ),
                  ),
                  Container(
                    //color: Colors.white,
                    width: dw * 0.95,
                    height: dh * 0.45,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          
                          decoration: BoxDecoration(
                            color: backGroundColorApp,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          width: dw * 0.95,
                          height: dh * 0.09,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: dw * 0.05),
                                child: Text(
                                  'SIS/mmHg',
                                  style: GoogleFonts.montserrat(
                                    fontSize: dg * 0.02,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: dw * 0.1),
                                width: dw * 0.1,
                                height: dh * 0.05,
                                child: TextField(
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    hintText: '120',
                                    hintStyle: GoogleFonts.montserrat(
                                      fontSize: dg * 0.02,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: dh * 0.01,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: backGroundColorApp,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          width: dw * 0.95,
                          height: dh * 0.09,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: dw * 0.05),
                                child: Text(
                                  'SIS/mmHg',
                                  style: GoogleFonts.montserrat(
                                    fontSize: dg * 0.02,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: dw * 0.1),
                                width: dw * 0.1,
                                height: dh * 0.05,
                                child: TextField(
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    hintText: '120',
                                    hintStyle: GoogleFonts.montserrat(
                                      fontSize: dg * 0.02,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: dh * 0.01,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: backGroundColorApp,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          width: dw * 0.95,
                          height: dh * 0.09,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: dw * 0.05),
                                child: Text(
                                  'SIS/mmHg',
                                  style: GoogleFonts.montserrat(
                                    fontSize: dg * 0.02,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: dw * 0.1),
                                width: dw * 0.1,
                                height: dh * 0.05,
                                child: TextField(
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    hintText: '120',
                                    hintStyle: GoogleFonts.montserrat(
                                      fontSize: dg * 0.025,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                   Container(
                          decoration: BoxDecoration(
                            color: backGroundColorApp,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          width: dw * 0.95,
                          height: dh * 0.08,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                               Container(
                                margin: EdgeInsets.only(left: dw * 0.05),
                                 child: Text('SIS/mmHg', style: GoogleFonts.montserrat(
                                  fontSize: dg * 0.02,
                                  ),),
                               ),
                                Container(
                                  margin: EdgeInsets.only(right: dw * 0.1),
                                  width: dw * 0.1,
                                  height: dh * 0.05,
                                  child: TextField(
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      hintText: '120',
                                      hintStyle: GoogleFonts.montserrat(
                                        fontSize: dg * 0.025,
                                      ),
                                    ),
                                  ),
                                ),
                                
                                
                            ],
                          ),
                        ),
                        ElevatedButton(onPressed: (){}, child: const Text('Guardar'))
                  // Agrega otros widgets aquí
                ],
              ),
            );
          },
        );
      },
      icon: Icon(
        Icons.add,
        color: Colors.white,
        size: dg * 0.08,
      ),
    );

    // ************ 1 ************
  }
}
