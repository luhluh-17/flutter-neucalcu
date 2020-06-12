import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

const String boxColor = 'appColor';
const double _opacity = 1.0;
const int _brightness = 25;

class ColorProvider with ChangeNotifier {
  Color _primary;

  var box = Hive.box(boxColor);

  Color get primary => Color(box.get('primary'));

  Color get primaryLight => _getPrimaryColorLight();

  Color get primaryDark => _getPrimaryColorDark();

  bool get isDarkMode => _isColorDark();

  updatePrimaryColor(Color color) {
    _primary = _getPrimaryColor(color);
    final box = Hive.box(boxColor);
    box.put('primary', _primary.value);
    notifyListeners();
  }

  Color _getPrimaryColor(Color color) {
    int min = 25;
    int max = 230;

    int red = color.red;
    int green = color.green;
    int blue = color.blue;

    red = (red < min) ? red += _brightness : red;
    green = (green < min) ? green += _brightness : green;
    blue = (blue < min) ? blue += _brightness : blue;

    red = (red > max) ? red -= _brightness : red;
    green = (green > max) ? green -= _brightness : green;
    blue = (blue > max) ? blue -= _brightness : blue;

    return Color.fromRGBO(red, green, blue, 1.0);
  }

  Color _getPrimaryColorLight() {
    return Color.fromRGBO(
      primary.red + _brightness,
      primary.green + _brightness,
      primary.blue + _brightness,
      _opacity,
    );
  }

  Color _getPrimaryColorDark() {
    return Color.fromRGBO(
      primary.red - _brightness,
      primary.green - _brightness,
      primary.blue - _brightness,
      _opacity,
    );
  }

  bool _isColorDark() {
    double red = 0.2126 * primary.red;
    double green = 0.7152 * primary.green;
    double blue = 0.0722 * primary.blue;

    double brightness = (red + green + blue) / 255;

    bool answer = (brightness > 0.5) ? true : false;
    return answer;
  }
}
