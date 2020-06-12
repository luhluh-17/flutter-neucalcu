import 'package:flutter/material.dart';
import 'package:neucalcu/themes/shadows.dart';

class CircleContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    return Container(
      height: 290.0,
      width: 290.0,
      decoration: getOuterShadowCircle(
        primary: _theme.primaryColor,
        lightShadow: _theme.primaryColorLight,
        darkShadow: _theme.primaryColorDark,
      ),
      child: Center(
        child: Container(
          height: 200.0,
          width: 200.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: _theme.primaryColorLight,
                spreadRadius: 20,
                blurRadius: 45,
                offset: Offset(0, 8), // changes position of shadow
              ),
            ],
          ),
          child: Center(
            child: Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                color: _theme.primaryColor,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
