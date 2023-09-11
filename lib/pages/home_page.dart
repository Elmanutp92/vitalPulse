import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graphic_representation/graphic_representation.dart';
import 'package:provider/provider.dart';
import 'package:vital_pulse/auth/sing_out.dart';
import 'package:vital_pulse/db/services/get_user_info.dart';
import 'package:vital_pulse/provider/user_data_provider.dart';
import 'package:vital_pulse/styles/colors.dart';
import 'package:vital_pulse/styles/responsive_size.dart';
import 'package:vital_pulse/widgets/butoom_sheet.dart';

class HomePage extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);
    double dw = responsive.width;
    double dh = responsive.height;
    double dg = responsive.diagonal;
    return Stack(children: [
      if (isLoading)
        const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Espera...'),
              CircularProgressIndicator(),
            ],
          ),
        ),
      if (!isLoading)
        Scaffold(
          appBar: AppBar(
          toolbarHeight: dh * 0.05,
            automaticallyImplyLeading: false,
            elevation: 0,
            backgroundColor: backGroundColorApp,
            actions: [
              IconButton(
                  onPressed: () {
                    singOut(context);
                  },
                  icon: const Icon(
                    Icons.menu,
                    color: azulTuquesa,
                  ))
            ],
          ),
          backgroundColor: backGroundColorApp,
          body: Consumer<UserDataProvider>(
            builder: (context, userDataProvider, child) {
              final userId = userDataProvider.userId;
              final email = userDataProvider.email;

              return FutureBuilder(
                  future: getUserInfo(userId),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      // Muestra un indicador de carga mientras se obtienen los datos.
                      return const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Espera, estamos cargando tus datos...'),
                            CircularProgressIndicator(),
                          ],
                        ),
                      );
                    } else if (snapshot.hasError) {
                      // Maneja errores si los hay.
                      return const Center(
                        child: Text('Error al cargar los datos.'),
                      );
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      // Maneja el caso en que no haya datos disponibles.
                      return const Center(
                        child: Text('No hay datos disponibles.'),
                      );
                    } else {
                      final data = snapshot.data!;
                      final name = data[0]['nombre'].toString();
                      final age = data[0]['edad'].toString();
                      final stature = data[0]['talla'].toString();
                      final etnia = data[0]['etnia'].toString();
                      final genero = data[0]['genero'].toString();

                      return Column(
                        children: [
                          Container(
                            width: dw,
                            height: dh * 0.1,
                            // color: Colors.white,
                            child: Row(
                              children: [
                                SizedBox(width: dw * 0.08),
                                CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 28,
                                  child: Icon(
                                    Icons.person,
                                    color: azulTuquesa,
                                    size: dg * 0.05,
                                  ),
                                ),
                                SizedBox(width: dw * 0.05),
                                Text(
                                  'Hola, $name',
                                  style: GoogleFonts.montserrat(
                                    fontSize: dg * 0.035,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: dh * 0.02),
                          Container(
                            width: dw,
                            height: dh * 0.31,
                            decoration: const BoxDecoration(
                              //color: azulCeleste,
                              shape: BoxShape.circle,
                            ),
                            child: CircularGraphic(
                              context: context,
                              nums: const [204, 121],
                              titles: const [
                                'Lunes',
                                'Martes',
                              ],
                              colors: const [
                                azulClaro,
                                azulReal,
                              ],
                              showPourcentage: true,
                              colorsInfo: Colors.white,
                            ),
                          ),
                          SizedBox(height: dh * 0.05),
                          Container(
                            width: dw * 0.8,

                            //color: Colors.white,
                            child: Text(
                              'Empieza tu primer registro de presion arterial. Recuerda buscar un ambiente tranquilo y en reposo.',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.montserrat(
                                fontSize: dg * 0.025,
                              ),
                            ),
                          ),
                          const Spacer(),
                          Stack(children: [
                            Container(
                              color: backGroundColorApp,
                              width: dw,
                              height: dh * 0.22,
                            ),
                            Positioned(
                              top: dh * 0.09,
                              child: Container(
                                color: azulClaro,
                                width: dw,
                                height: dh * 0.13,
                              ),
                            ),
                            Positioned(
                              left: dw * 0.1,
                              top: dh * 0.02,
                              child: Container(
                                width: dw * 0.8,
                                height: dh * 0.17,
                                decoration: const BoxDecoration(
                                    color: backGroundColorApp,
                                    shape: BoxShape.circle),
                              ),
                            ),
                            Positioned(
                              left: dw * 0.1,
                              top: dh * 0.028,
                              child: Container(
                                width: dw * 0.8,
                                height: dh * 0.15,
                                decoration: const BoxDecoration(
                                    color: azulTuquesa, shape: BoxShape.circle),
                                child: const  ButoomSheet(),
                              ),
                            ),
                          ])
                        ],
                      );
                    }
                  });
            },
          ),
        ),
    ]);
  }
}
