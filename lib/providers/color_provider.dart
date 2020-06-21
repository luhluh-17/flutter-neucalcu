import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

const String boxColor = 'appColor';
const double _opacity = 1.0;
const int _brightness = 25;

class ColorProvider with ChangeNotifier {
  Color _primary;

  final _box = Hive.box(boxColor);

  Color get primary => Color(_box.get('primary'));

  Color get primaryLight => _primaryLight();

  Color get primaryDark => _primaryDark();

  bool get darkMode => _darkMode();

  updatePrimaryColor(Color color) {
    _primary = _primaryColor(color);
    _box.put('primary', _primary.value);
    notifyListeners();
  }

  // to get better combination of neumorphic colors
  // primary range must be (25, 230) because brightness is set to 25
  // to prevent any color to go beyond the color range (0, 255)
  Color _primaryColor(Color color) {
    int min = 25;
    int max = 230;

    int red = color.red;
    int green = color.green;
    int blue = color.blue;

    // adjust rgb values if below minimum
    red = (red < min) ? red += _brightness : red;
    green = (green < min) ? green += _brightness : green;
    blue = (blue < min) ? blue += _brightness : blue;

    // adjust rgb values if above maximum
    red = (red > max) ? red -= _brightness : red;
    green = (green > max) ? green -= _brightness : green;
    blue = (blue > max) ? blue -= _brightness : blue;

    return Color.fromRGBO(red, green, blue, 1.0);
  }

  // adding brightness to primary rgb to get light color
  Color _primaryLight() {
    return Color.fromRGBO(
      primary.red + _brightness,
      primary.green + _brightness,
      primary.blue + _brightness,
      _opacity,
    );
  }

  // subtracting brightness to primary rgb to get dark color
  Color _primaryDark() {
    return Color.fromRGBO(
      primary.red - _brightness,
      primary.green - _brightness,
      primary.blue - _brightness,
      _opacity,
    );
  }

  // checks primary color if it has a darker or lighter shade
  bool _darkMode() {
    double red = 0.2126 * primary.red;
    double green = 0.7152 * primary.green;
    double blue = 0.0722 * primary.blue;
    double luminance = (red + green + blue) / 255;

    return (luminance > 0.5) ? true : false;
  }
}
