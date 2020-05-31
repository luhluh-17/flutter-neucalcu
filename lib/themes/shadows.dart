import 'package:flutter/material.dart';
import 'package:neucalcu/widgets/concave_decoration.dart';

import 'colors.dart';

const double _radius = 24.0;
const double _blurRadius = 12.0;
const Offset _offset = Offset(2, 2);

ConcaveDecoration getInnerShadow({double radius = _radius}) {
  return ConcaveDecoration(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(radius),
    ),
    colors: [AppColors.lightShadow, AppColors.darkShadow],
    depth: 6.0,
  );
}

BoxDecoration getOuterShadow({double radius = _radius}) {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(radius),
    color: AppColors.baseColor,
    boxShadow: [
      BoxShadow(
        blurRadius: _blurRadius,
        offset: -_offset,
        color: AppColors.lightShadow,
      ),
      BoxShadow(
        blurRadius: _blurRadius,
        offset: _offset,
        color: AppColors.darkShadow,
      ),
    ],
  );
}
