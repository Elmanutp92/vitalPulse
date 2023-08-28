import 'dart:math';
import 'package:flutter/widgets.dart';

class Responsive {
  double _width = 0;
  double _height = 0;
  double _diagonal = 0;

  Responsive(BuildContext context) {
    final size = MediaQuery.of(context).size;
    _width = size.width;
    _height = size.height;
    _diagonal = sqrt((_width * _width) + (_height * _height));
  }

  double get width => _width;
  double get height => _height;
  double get diagonal => _diagonal;
}
