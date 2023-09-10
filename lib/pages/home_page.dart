import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vital_pulse/auth/sing_out.dart';
import 'package:vital_pulse/db/services/get_user_info.dart';

import 'package:vital_pulse/provider/user_data_provider.dart';

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

                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              
                              width: 300,
                              height: 300,
                              child: Card(
                                elevation: 12,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Nombre: $name'),
                                    Text('Edad: $age'),
                                    Text('Estatura: $stature'),
                                    Text('Email: $email'),
                                  ],
                                ),
                              ),
                            ),
                            ElevatedButton(onPressed: (){
                              singOut(context);
                            }, child: const Text('Cerrar sesión'))
                          ],
                        ),
                      );
                    }
                  });
              /*Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        'Bienvenido: ${name.isNotEmpty ? name : 'Cargando...'}'),
                    Text('Edad: ${age.isNotEmpty ? age : 'Cargando...'}'),
                    Text(
                        'Estatura: ${stature.isNotEmpty ? stature : 'Cargando...'}'),
                    Text('Email: ${email.isNotEmpty ? email : 'Cargando... '}'),
                    Text(
                        'UserId: ${userId.isNotEmpty ? userId : 'Cargando...'}'),
                    const SizedBox(height: 20),
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            isLoading = true;
                          });
                          singOut(context);
                          setState(() {
                            isLoading = false;
                          });
                        },
                        child: const Text('Cerrar sesión'))
                  ],
                ),
              );*/
            },
          ),
        ),
    ]);
  }
}
