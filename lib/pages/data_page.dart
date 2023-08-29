import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vital_pulse/styles/colors.dart';
import 'package:vital_pulse/styles/responsive_size.dart';
import 'package:vital_pulse/widgets/text_form_field.dart';
import 'package:vital_pulse/widgets/text_form_field2.dart';
import 'package:vital_pulse/widgets/text_form_field_options.dart';

class DataPage extends StatefulWidget {
  const DataPage({super.key});

  @override
  State<DataPage> createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);
    double dw = responsive.width;
    double dh = responsive.height;
    double dg = responsive.diagonal;

    return Scaffold(
        backgroundColor: backGroundColorApp,
        body: SingleChildScrollView(
          child: Container(
            //margin: EdgeInsets.only(top: dh * 0.01),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Center(
                      child: Stack(children: [
                        Image(
                          width: dw * 1,
                          height: dh * 0.4,
                          image: const AssetImage('assets/logoDataPage.png'),
                        ),
                        Positioned(
                          top: dh * 0.3,
                          left: dw * 0.12,
                          child: Text(
                            'Completa tus datos',
                            style: GoogleFonts.montserrat(
                                fontSize: dg * 0.03,
                                fontWeight: FontWeight.w500,
                                color: azulMarino),
                          ),
                        ),
                      ]),
                    ),
                    Form(
                        child: Column(
                      children: [
                        TextFormFieldApp2(
                            font: 0.015,
                            height: 0.06,
                            labelText: 'Nombre',
                            hintText: 'Ingresa tu nombre',
                            obscureText: false,
                            isPassword: false),
                        TextFormFieldOptions(
                          height: 0.06,
                          labelText: 'Género',
                          hintText: 'Selecciona tu género',
                        
                        ),
                        TextFormFieldApp2(
                            font: 0.015,
                            height: 0.06,
                            labelText: 'Edad',
                            hintText: 'Ingresa tu edad',
                            obscureText: false,
                            isPassword: false),
                        TextFormFieldApp2(
                            font: 0.015,
                            height: 0.06,
                            labelText: 'Peso',
                            hintText: 'Ingresa tu peso',
                            obscureText: false,
                            isPassword: false),
                        TextFormFieldApp2(
                            font: 0.015,
                            height: 0.06,
                            labelText: 'Talla',
                            hintText: 'Ingresa tu estatura',
                            obscureText: false,
                            isPassword: false),
                        TextFormFieldApp2(
                            font: 0.015,
                            height: 0.06,
                            labelText: 'Etnia',
                            hintText: 'Ingresa tu etnia',
                            obscureText: false,
                            isPassword: false),
                      ],
                    )),
                    SizedBox(
                      height: dh * 0.035,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: azulTuquesa,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: EdgeInsets.symmetric(
                              vertical: dh * 0.02, horizontal: dw * 0.17),
                        ),
                        onPressed: () {
                         /* Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const DataPage()),
                          );*/


                        },
                        child: Text(
                          'Siguiente',
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.bold,
                              fontSize: dg * 0.02,
                              color: Colors.white),
                        ))
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}

class TextFormFieldAppOptions {
}
