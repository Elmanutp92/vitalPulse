import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:vital_pulse/db/register_user_info.dart';
import 'package:vital_pulse/styles/colors.dart';
import 'package:vital_pulse/styles/responsive_size.dart';

import 'package:vital_pulse/widgets/text_form_field_options.dart';

class DataPage extends StatefulWidget {
  const DataPage({super.key});

  @override
  State<DataPage> createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController statureController = TextEditingController();
  final TextEditingController etniaController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isLoaging = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameController.dispose();
    genderController.dispose();
    ageController.dispose();
    weightController.dispose();
    statureController.dispose();
    etniaController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);
    double dw = responsive.width;
    double dh = responsive.height;
    double dg = responsive.diagonal;

    return PopScope(
      canPop: false,
      child: Stack(children: [
        if (isLoaging)
          Positioned.fill(
            child: Container(
              color: backGroundColorApp.withOpacity(0.5),
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Cargando...',
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.bold,
                          fontSize: dg * 0.02,
                          color: azulMedianoche)),
                  const LoadingIndicator(
                      indicatorType: Indicator.ballScaleMultiple,

                      /// Required, The loading type of the widget
                      colors: [azulTuquesa, azulMedianoche],

                      /// Optional, The color collections
                      //strokeWidth: 2,

                      /// Optional, The stroke of the line, only applicable to widget which contains line
                      backgroundColor: backGroundColorApp,

                      /// Optional, Background of the widget
                      pathBackgroundColor: backGroundColorApp

                      /// Optional, the stroke backgroundColor
                      ),
                ],
              )),
            ),
          ),
        if (!isLoaging)
          Scaffold(
              backgroundColor: backGroundColorApp,
              body: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Stack(children: [
                          Image(
                            width: dw * 1,
                            height: dh * 0.4,
                            image: const AssetImage('assets/logoDataPage.png'),
                          ),
                          Positioned(
                            top: dh * 0.3,
                            left: dw * 0.18,
                            child: Text(
                              'Completa tus datos',
                              style: GoogleFonts.montserrat(
                                  fontSize: dg * 0.03,
                                  fontWeight: FontWeight.w500,
                                  color: azulMarino),
                            ),
                          ),
                        ]),
                        Form(
                            key: formKey,
                            child: Column(
                              children: [
                                // NOMBRE
                                Container(
                                  height: dh * 0.06,
                                  margin: const EdgeInsets.all(5),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      fillColor: Colors
                                          .white, // Color de fondo del campo
                                      filled:
                                          true, // Habilitar el relleno de color
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      labelText: 'Nombre',
                                      hintText: 'Ingresa tu nombre',

                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: dh *
                                              0.02, // Ajusta el espacio vertical dentro del TextFormField
                                          horizontal: dw *
                                              0.03 // Espacio horizontal constante
                                          ),
                                      labelStyle: TextStyle(
                                        color: azulMarino,
                                        fontSize: dg *
                                            0.015, // Ajusta el tamaño de la etiqueta
                                        // Puedes ajustar el peso de la etiqueta
                                      ),
                                    ),
                                  ),
                                ),
                                //GENERO
                                TextFormFieldOptions(
                                  options: const [
                                    'Masculino',
                                    'Femenino',
                                    'Otro'
                                  ],
                                  font: 0.015,
                                  height: 0.06,
                                  labelText: 'Género',
                                  hintText: 'Selecciona tu género',
                                ),
                                // EDAD
                                Container(
                                  height: dh * 0.06,
                                  margin: const EdgeInsets.all(5),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      fillColor: Colors
                                          .white, // Color de fondo del campo
                                      filled:
                                          true, // Habilitar el relleno de color
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      labelText: 'Edad',
                                      hintText: 'Ingresa tu edad',

                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: dh *
                                              0.02, // Ajusta el espacio vertical dentro del TextFormField
                                          horizontal: dw *
                                              0.03 // Espacio horizontal constante
                                          ),
                                      labelStyle: TextStyle(
                                        color: azulMarino,
                                        fontSize: dg *
                                            0.015, // Ajusta el tamaño de la etiqueta
                                        // Puedes ajustar el peso de la etiqueta
                                      ),
                                    ),
                                  ),
                                ),
                                // PESO
                                Container(
                                  height: dh * 0.06,
                                  margin: const EdgeInsets.all(5),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      fillColor: Colors
                                          .white, // Color de fondo del campo
                                      filled:
                                          true, // Habilitar el relleno de color
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      labelText: 'Peso',
                                      hintText: 'Ingresa tu peso',

                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: dh *
                                              0.02, // Ajusta el espacio vertical dentro del TextFormField
                                          horizontal: dw *
                                              0.03 // Espacio horizontal constante
                                          ),
                                      labelStyle: TextStyle(
                                        color: azulMarino,
                                        fontSize: dg *
                                            0.015, // Ajusta el tamaño de la etiqueta
                                        // Puedes ajustar el peso de la etiqueta
                                      ),
                                    ),
                                  ),
                                ),
                                // TALLA
                                Container(
                                  height: dh * 0.06,
                                  margin: const EdgeInsets.all(5),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      fillColor: Colors
                                          .white, // Color de fondo del campo
                                      filled:
                                          true, // Habilitar el relleno de color
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      labelText: 'Talla',
                                      hintText: 'Ingresa tu talla',

                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: dh *
                                              0.02, // Ajusta el espacio vertical dentro del TextFormField
                                          horizontal: dw *
                                              0.03 // Espacio horizontal constante
                                          ),
                                      labelStyle: TextStyle(
                                        color: azulMarino,
                                        fontSize: dg *
                                            0.015, // Ajusta el tamaño de la etiqueta
                                        // Puedes ajustar el peso de la etiqueta
                                      ),
                                    ),
                                  ),
                                ),
                                // ETNIA
                                TextFormFieldOptions(
                                  options: const [
                                    'Latino',
                                    'Raizal',
                                    'Afro',
                                    'Indigena',
                                    'Otro'
                                  ],
                                  font: 0.015,
                                  height: 0.06,
                                  labelText: 'Etnia',
                                  hintText: 'Ingresa tu etnia',
                                )
                              ],
                            )),
                        SizedBox(
                          height: dh * 0.035,
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 8,
                              backgroundColor: azulTuquesa,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: EdgeInsets.symmetric(
                                  vertical: dh * 0.02, horizontal: dw * 0.17),
                            ),
                            onPressed: () {
                              setState(() {
                                isLoaging = true;
                              });
                              if (formKey.currentState!.validate()) {
                                registerUserInfo(
                                    nameController.text,
                                    'masculino',
                                    ageController.text,
                                    weightController.text,
                                    statureController.text,
                                    'Raizal',
                                    context);
                                setState(() {
                                  isLoaging = false;
                                });
                               
                                print('Validado');
                              } else {
                                print('No validado');
                              }
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
              )),
      ]),
    );
  }
}
