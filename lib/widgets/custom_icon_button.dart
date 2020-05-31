import 'package:flutter/material.dart';
import 'package:neucalcu/themes/colors.dart';
import 'package:neucalcu/themes/shadows.dart';

class CustomIconButton extends StatefulWidget {
  final Icon icon;

  CustomIconButton({this.icon});

  @override
  _CustomIconButtonState createState() => _CustomIconButtonState();
}

class _CustomIconButtonState extends State<CustomIconButton> {
  bool _isPressed = false;
  double _buttonSize = 45.0;
  double _iconSize = 20.0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _buttonSize,
      width: _buttonSize,
      child: Listener(
        onPointerDown: (event) {
          setState(() => _isPressed = true);
        },
        onPointerUp: (event) {
          setState(() => _isPressed = false);
        },
        child: Stack(
          children: <Widget>[
            AnimatedContainer(
              duration: Duration(milliseconds: 100),
              decoration: _isPressed
                  ? getInnerShadow(radius: 25.0)
                  : getOuterShadow(radius: 25.0),
            ),
            Center(
              child: Icon(
                Icons.settings,
                color: AppColors.accent,
                size: _iconSize,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
