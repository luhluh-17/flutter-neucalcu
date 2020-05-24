import 'package:flutter/material.dart';

class AppColors {
  static const int _red = 33;
  static const int _green = 33;
  static const int _blue = 33;
  static const int _brightness = 25;

  static const Color baseColor = Color.fromRGBO(_red, _green, _blue, 1);
  static const Color lightShadow = Color.fromRGBO(
      (_red + _brightness), (_green + _brightness), (_blue + _brightness), 1);
  static const Color darkShadow = Color.fromRGBO(
      (_red - _brightness), (_green - _brightness), (_blue - _brightness), 1);

  static const Color primaryText = Colors.white;
  static const Color accent = Colors.pinkAccent;
}
