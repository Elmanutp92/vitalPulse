import 'package:flutter/material.dart';
import 'package:vital_pulse/styles/colors.dart';
import 'package:vital_pulse/styles/responsive_size.dart';

// ignore: must_be_immutable
class TextFormFieldOptions extends StatefulWidget {
  final String? labelText;
  final String? hintText;
  double? height;
  double? font;
  List<String>? options;

  TextFormFieldOptions({
    super.key,
    this.labelText,
    this.hintText,
    this.height,
    this.font,
    this.options,
  });

  @override
  State<TextFormFieldOptions> createState() => _TextFormFieldOptionsState();
}

class _TextFormFieldOptionsState extends State<TextFormFieldOptions> {
  String? selectedOption;
  // final List<String> genero = ;

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);
    double dw = responsive.width;
    double dh = responsive.height;
    double dg = responsive.diagonal;

    return Container(
      height: dh * widget.height!.toDouble(),
      margin: const EdgeInsets.all(5),
      child: DropdownButtonFormField<String>(
        value: selectedOption, // Valor seleccionado
        items: ['Masculino', 'Femenino', 'Otro'].map((String option) {
          return DropdownMenuItem<String>(
            value: option,
            child: Text(option),
          );
        }).toList(),
        onChanged: (newValue) {
          setState(() {
            selectedOption = newValue; // Actualizar la opción seleccionada
          });
        },
        decoration: InputDecoration(
          fillColor: Colors.white, // Color de fondo del campo
          filled: true, // Habilitar el relleno de color
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(20),
          ),
          labelText: widget.labelText,
          hintText: widget.hintText,

          contentPadding: EdgeInsets.symmetric(
              vertical: dh *
                  0.02, // Ajusta el espacio vertical dentro del TextFormField
              horizontal: dw * 0.03 // Espacio horizontal constante
              ),
          labelStyle: TextStyle(
            color: azulMarino,
            fontSize:
                dg * widget.font!.toDouble(), // Ajusta el tamaño de la etiqueta
            // Puedes ajustar el peso de la etiqueta
          ),
        ),
      ),
    );
  }
}
