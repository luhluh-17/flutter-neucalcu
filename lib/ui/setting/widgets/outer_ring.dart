import 'package:flutter/material.dart';
import 'package:neucalcu/ui/widgets/shadows.dart';

class OuterRing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    return Container(
      height: 290.0,
      width: 290.0,
      decoration: outerShadowCircle(context),
      child: Center(
        child: Container(
          height: 200.0,
          width: 200.0,
          decoration: innerShadowCircle(context),
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
