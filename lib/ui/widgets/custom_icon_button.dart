import 'package:flutter/material.dart';
import 'package:neucalcu/themes/colors.dart';
import 'package:neucalcu/themes/shadows.dart';

class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final double size;
  final Function onPressed;

  CustomIconButton({this.icon, this.size = 20.0, @required this.onPressed});

  static const double _buttonSize = 40.0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _buttonSize,
      width: _buttonSize,
      child: Listener(
        onPointerDown: (event) => onPressed(),
        child: Stack(
          children: <Widget>[
            Container(
              decoration: getOuterShadow(radius: 25.0),
            ),
            Center(
              child: Icon(
                icon,
                color: AppColors.accent,
                size: size,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
