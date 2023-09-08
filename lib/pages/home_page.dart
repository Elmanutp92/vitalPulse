import 'package:flutter/material.dart';
import 'package:vital_pulse/auth/sing_out.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Home Page'),
            ElevatedButton(onPressed: () async {
             await  singOut(context);
            }, child: const Text('cerrar sesion '))
          ],
        ),
      ),
    );
  }
}