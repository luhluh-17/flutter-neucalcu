import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:neucalcu/themes/colors.dart';

const String boxColor = 'appColor';
const double _opacity = 1.0;
const int _brightness = 25;

class ColorProvider with ChangeNotifier {
  Color _primary;
  Color _primaryLight;
  Color _primaryDark;
  Color _primaryText;
  Color _secondaryText;
  bool _isDarkMode;

  var box = Hive.box(boxColor);

  Color get primary => Color(box.get('primary'));

  Color get primaryLight => Color(box.get('primaryLight'));

  Color get primaryDark => Color(box.get('primaryDark'));

  Color get primaryText => Color(box.get('primaryText'));

  Color get secondaryText => Color(box.get('secondaryText'));

  bool get isDarkMode => _isColorDark(primary);

  updatePrimaryColor(Color color) {

    _primary = _getPrimaryColor(color);

    _primaryLight = Color.fromRGBO(
      _primary.red + _brightness,
      _primary.green + _brightness,
      _primary.blue + _brightness,
      _opacity,
    );

    _primaryDark = Color.fromRGBO(
      _primary.red - _brightness,
      _primary.green - _brightness,
      _primary.blue - _brightness,
      _opacity,
    );

    final box = Hive.box(boxColor);
    box.put('primary', _primary.value);
    box.put('primaryLight', _primaryLight.value);
    box.put('primaryDark', _primaryDark.value);

    _isDarkMode = _isColorDark(_primary);

    if (_isDarkMode) {
      _primaryText = AppColors.darkPrimaryText;
      _secondaryText = AppColors.darkSecondaryText;

      box.put('primaryText', _primaryText.value);
      box.put('secondaryText', _secondaryText.value);
    } else {

      _primaryText = AppColors.lightPrimaryText;
      _secondaryText = AppColors.lightSecondaryText;

      box.put('primaryText', _primaryText.value);
      box.put('secondaryText', _secondaryText.value);
    }

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

  bool _isColorDark(Color color) {
    double brightness =
        (0.299 * color.red + 0.587 * color.green + 0.114 * color.blue) / 255;

    bool answer = (brightness > 0.5) ? true : false;
    return answer;
  }
}
