import 'package:flutter/material.dart';

class InnerRing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return Center(
      child: Container(
        height: 300 * 0.25,
        width: 300 * 0.25,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              offset: Offset(-1.5, -1.5),
              color: _theme.primaryColorDark,
              spreadRadius: 4.0,
            ),
            BoxShadow(
              offset: Offset(1.5, 1.5),
              color: _theme.primaryColorLight,
              spreadRadius: 2.0,
              blurRadius: 4,
            )
          ],
        ),
      ),
    );
  }
}
