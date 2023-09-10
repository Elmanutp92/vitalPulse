import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:vital_pulse/db/register_user_info.dart';
import 'package:vital_pulse/styles/colors.dart';
import 'package:vital_pulse/styles/responsive_size.dart';



class DataPage extends StatefulWidget {
  const DataPage({super.key});

  @override
  State<DataPage> createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController ageController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController statureController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isLoading = false;

  @override
  void dispose() {
    
    super.dispose();
    nameController.dispose();

    ageController.dispose();
    weightController.dispose();
    statureController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String? selectedOptionGender = 'Otro';
    String? selectedOptionEtnia = 'Otro';
    Responsive responsive = Responsive(context);
    double dw = responsive.width;
    double dh = responsive.height;
    double dg = responsive.diagonal;

    return PopScope(
      canPop: false,
      child: Stack(children: [
        if (isLoading)
          Positioned.fill(
            child: Scaffold(
              body: Container(
                height: dh * 1,
                color: backGroundColorApp,
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
                      // backgroundColor: backGroundColorApp,
            
                      /// Optional, Background of the widget
                      //pathBackgroundColor: backGroundColorApp
            
                      /// Optional, the stroke backgroundColor
                    ),
                  ],
                )),
              ),
            ),
          ),
        if (!isLoading)
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
                                    controller: nameController,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Por favor ingresa tu nombre';
                                      }
                                      return null;
                                    },
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
                                Container(
                                  height: dh * 0.06,
                                  margin: const EdgeInsets.all(5),
                                  child: DropdownButtonFormField<String>(
                                    value: selectedOptionGender,
                                    // Valor seleccionado
                                    items: ['Masculino', 'Femenino', 'Otro']
                                        .map((String option) {
                                      return DropdownMenuItem<String>(
                                        value: option,
                                        child: Text(option),
                                      );
                                    }).toList(),
                                    onChanged: (newValue) {
                                      setState(() {
                                        selectedOptionGender =
                                            newValue!; // Actualizar la opción seleccionada
                                      });
                                    },
                                    decoration: InputDecoration(
                                      fillColor: Colors
                                          .white, // Color de fondo del campo
                                      filled:
                                          true, // Habilitar el relleno de color
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      labelText: 'Genero',
                                      hintText: 'Ingresa tu genero',

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
                                // EDAD
                                Container(
                                  height: dh * 0.06,
                                  margin: const EdgeInsets.all(5),
                                  child: TextFormField(
                                    controller: ageController,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Por favor ingresa tu nombre';
                                      }
                                      return null;
                                    },
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
                                    controller: weightController,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Por favor ingresa tu nombre';
                                      }
                                      return null;
                                    },
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
                                    controller: statureController,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Por favor ingresa tu nombre';
                                      }
                                      return null;
                                    },
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
                                Container(
                                  height: dh * 0.06,
                                  margin: const EdgeInsets.all(5),
                                  child: DropdownButtonFormField<String>(
                                    value:
                                        selectedOptionEtnia, // Valor seleccionado
                                    items: [
                                      'Raizal',
                                      'Palenquero',
                                      'Latino/a',
                                      'Otro'
                                    ].map((String option) {
                                      return DropdownMenuItem<String>(
                                        value: option,
                                        child: Text(option),
                                      );
                                    }).toList(),
                                    onChanged: (newValue) {
                                      setState(() {
                                        selectedOptionEtnia =
                                            newValue!; // Actualizar la opción seleccionada
                                      });
                                    },
                                    decoration: InputDecoration(
                                      fillColor: Colors
                                          .white, // Color de fondo del campo
                                      filled:
                                          true, // Habilitar el relleno de color
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      labelText: 'Etnia',
                                      hintText: 'Ingresa tu etnia',

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
                            onPressed: () async {
                              setState(() {
                                isLoading = true;
                              });
                              if (formKey.currentState!.validate()) {
                                await registerUserInfo(
                                  nameController.text,
                                  selectedOptionGender,
                                  ageController.text,
                                  weightController.text,
                                  statureController.text,
                                  selectedOptionEtnia,
                                  context,
                                );
                                setState(() {
                                  isLoading = false;
                                });
                               // print('Validado');
                              } else {
                               // print('No validado');
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
