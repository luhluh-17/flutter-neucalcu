import 'package:flutter/material.dart';
import 'package:neucalcu/ui/widgets/concave_decoration.dart';

import 'colors.dart';

const double _radius = 24.0;
const double _blurRadius = 12.0;

const List<BoxShadow> _shadows = [
  BoxShadow(
    blurRadius: _blurRadius,
    offset: Offset(-4, -4),
    color: AppColors.primaryLight,
  ),
  BoxShadow(
    blurRadius: _blurRadius,
    offset: Offset(4, 4),
    color: AppColors.primaryDark,
  ),
];

ConcaveDecoration getInnerShadow({double radius = _radius}) {
  return ConcaveDecoration(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(radius),
    ),
    colors: [AppColors.primaryLight, AppColors.primaryDark],
    depth: 6.0,
  );
}

BoxDecoration getOuterShadow({double radius = _radius}) {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(radius),
    color: AppColors.primary,
    boxShadow: _shadows
  );
}

BoxDecoration getOuterShadowCircle() {
  return BoxDecoration(
    shape: BoxShape.circle,
    color: AppColors.primary,
    boxShadow: _shadows
  );
}
