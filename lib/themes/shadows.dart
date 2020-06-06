import 'package:flutter/material.dart';
import 'file:///C:/AppFlutter/LuhLuh/neumorphic_calculator/lib/widgets/concave_decoration.dart';

import 'colors.dart';

const double _radius = 24.0;
const double _blurRadius = 12.0;
const Offset _offset = Offset(4, 4);

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
    boxShadow: [
      BoxShadow(
        blurRadius: _blurRadius,
        offset: -_offset,
        color: AppColors.primaryLight,
      ),
      BoxShadow(
        blurRadius: _blurRadius,
        offset: _offset,
        color: AppColors.primaryDark,
      ),
    ],
  );
}
