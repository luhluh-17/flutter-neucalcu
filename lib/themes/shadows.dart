import 'package:flutter/material.dart';
import 'package:neucalcu/ui/widgets/concave_decoration.dart';

const double _radius = 24.0;
const double _blurRadius = 12.0;

List<BoxShadow> _getShadows({@required Color light, @required Color dark}) {
  List<BoxShadow> shadows = [
    BoxShadow(
      blurRadius: _blurRadius,
      offset: Offset(-4, -4),
      color: light,
    ),
    BoxShadow(
      blurRadius: _blurRadius,
      offset: Offset(4, 4),
      color: dark,
    ),
  ];
  return shadows;
}

ConcaveDecoration getInnerShadow(
    {double radius = _radius,
    @required Color lightShadow,
    @required Color darkShadow}) {
  return ConcaveDecoration(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(radius),
    ),
    colors: [lightShadow, darkShadow],
    depth: 6.0,
  );
}

BoxDecoration getOuterShadow({
  double radius = _radius,
  @required Color primary,
  @required Color lightShadow,
  @required Color darkShadow,
}) {
  return BoxDecoration(
      borderRadius: BorderRadius.circular(radius),
      color: primary,
      boxShadow: _getShadows(light: lightShadow, dark: darkShadow));
}

BoxDecoration getOuterShadowCircle({
  @required Color primary,
  @required Color lightShadow,
  @required Color darkShadow,
}) {
  return BoxDecoration(
    shape: BoxShape.circle,
    color: primary,
    boxShadow: _getShadows(light: lightShadow, dark: darkShadow),
  );
}
