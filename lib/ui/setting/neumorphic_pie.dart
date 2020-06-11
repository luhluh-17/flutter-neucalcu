import 'package:flutter/material.dart';
import 'package:neucalcu/themes/colors.dart';
import 'package:neucalcu/themes/shadows.dart';

import 'inner_ring.dart';

class CircleContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 290.0,
      width: 290.0,
      decoration: getOuterShadowCircle(),
      child: Center(
        child: Container(
          height: 200.0,
          width: 200.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: AppColors.primaryLight,
                spreadRadius: 20,
                blurRadius: 45,
                offset: Offset(0, 8), // changes position of shadow
              ),
            ],
          ),
          child: Stack(
            children: <Widget>[
              Center(child: InnerRing(width: 300.0)),
            ],
          ),
        ),
      ),
    );
  }
}
