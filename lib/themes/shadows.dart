import 'package:flutter/material.dart';
import 'package:neucalcu/widgets/concave_decoration.dart';

import 'colors.dart';

const double _radius = 16.0;
const double _depth = 8.0;

ConcaveDecoration kInnerShadow = ConcaveDecoration(
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(_radius),
  ),
  colors: [AppColors.lightShadow, AppColors.darkShadow],
  depth: _depth,
);

BoxDecoration kOuterShadow = BoxDecoration(
  borderRadius: BorderRadius.circular(_radius),
  color: AppColors.baseColor,
  boxShadow: [
    BoxShadow(
      blurRadius: 15,
      offset: -Offset(4, 4),
      color: AppColors.lightShadow,
    ),
    BoxShadow(
      blurRadius: 15,
      offset: Offset(4, 4),
      color: AppColors.darkShadow,
    ),
  ],
);