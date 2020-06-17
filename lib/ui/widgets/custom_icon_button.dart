import 'package:flutter/material.dart';

import 'shadows.dart';

const double _buttonSize = 40.0;

class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final double size;
  final Function onPressed;

  CustomIconButton({this.icon, this.size = 20.0, @required this.onPressed});

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
              decoration: outerShadow(context, radius: 25.0),
            ),
            Center(
              child: Icon(icon, color: _theme.accentColor, size: size),
            ),
          ],
        ),
      ),
    );
  }
}
