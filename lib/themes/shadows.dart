import 'package:flutter/material.dart';
import 'package:neucalcu/widgets/concave_decoration.dart';

import 'colors.dart';

ConcaveDecoration getInnerShadow({double radius = 16.0}) {
  return ConcaveDecoration(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(radius),
    ),
    colors: [AppColors.lightShadow, AppColors.darkShadow],
    depth: 6.0,
  );
}

BoxDecoration getOuterShadow({double radius = 16.0}) {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(radius),
    color: AppColors.baseColor,
    boxShadow: [
      BoxShadow(
        blurRadius: 15,
        offset: -Offset(3, 3),
        color: AppColors.lightShadow,
      ),
      BoxShadow(
        blurRadius: 15,
        offset: Offset(3, 3),
        color: AppColors.darkShadow,
      ),
    ],
  );
}
