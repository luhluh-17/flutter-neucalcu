import 'package:flutter/material.dart';
import 'package:neucalcu/themes/shadows.dart';

class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final double size;
  final Function onPressed;

  CustomIconButton({this.icon, this.size = 20.0, @required this.onPressed});

  static const double _buttonSize = 40.0;

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    return SizedBox(
      height: _buttonSize,
      width: _buttonSize,
      child: Listener(
        onPointerDown: (event) => onPressed(),
        child: Stack(
          children: <Widget>[
            Container(
              decoration: getOuterShadow(
                radius: 25.0,
                lightShadow: _theme.primaryColorLight,
                darkShadow: _theme.primaryColorDark,
                primary: _theme.primaryColor
              ),
            ),
            Center(
              child: Icon(
                icon,
                color: Theme.of(context).accentColor,
                size: size,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
