import 'package:flutter/material.dart';

import 'package:vital_pulse/styles/colors.dart';
import 'package:vital_pulse/styles/responsive_size.dart';

// ignore: must_be_immutable
class TextFormFieldApp extends StatefulWidget {
  final String? labelText;
  final String? hintText;
  bool obscureText;
  bool isPassword;

  TextFormFieldApp({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.obscureText,
    required this.isPassword,
  });

  @override
  State<TextFormFieldApp> createState() => _TextFormFieldAppState();
}

class _TextFormFieldAppState extends State<TextFormFieldApp> {
  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);
    double dw = responsive.width;
    double dh = responsive.height;
    double dg = responsive.diagonal;

    return Container(
      height: dh * 0.08,
      margin: const EdgeInsets.all(10),
      child: TextFormField(
        obscureText: widget.obscureText,
        decoration: InputDecoration(
          fillColor: Colors.white, // Color de fondo del campo
          filled: true, // Habilitar el relleno de color
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(20),
          ),
          labelText: widget.labelText,
          hintText: widget.hintText,

          suffixIcon: widget.obscureText && widget.isPassword ||
                  widget.isPassword && !widget.obscureText
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      widget.obscureText = !widget.obscureText;
                    });
                  },
                  icon: Icon(widget.obscureText
                      ? Icons.visibility_off
                      : Icons.visibility),
                )
              : const SizedBox(),

          contentPadding: EdgeInsets.symmetric(
              vertical: dh *
                  0.02, // Ajusta el espacio vertical dentro del TextFormField
              horizontal: dw * 0.03 // Espacio horizontal constante
              ),
          labelStyle: TextStyle(
            color: azulMarino,
            fontSize: dg * 0.02, // Ajusta el tamaño de la etiqueta
            // Puedes ajustar el peso de la etiqueta
          ),
        ),
      ),
    );
  }
}
