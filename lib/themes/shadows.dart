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

ConcaveDecoration getInnerShadow(BuildContext context,
    {double radius = _radius}) {
  final _theme = Theme.of(context);
  return ConcaveDecoration(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(radius),
    ),
    colors: [_theme.primaryColorLight, _theme.primaryColorDark],
    depth: 6.0,
  );
}

BoxDecoration getOuterShadow(BuildContext context, {double radius = _radius}) {
  final _theme = Theme.of(context);

  return BoxDecoration(
    borderRadius: BorderRadius.circular(radius),
    color: _theme.primaryColor,
    boxShadow: _getShadows(
      light: _theme.primaryColorLight,
      dark: _theme.primaryColorDark,
    ),
  );
}

BoxDecoration getOuterShadowCircle(BuildContext context) {
  final _theme = Theme.of(context);
  return BoxDecoration(
    shape: BoxShape.circle,
    color: _theme.primaryColor,
    boxShadow: _getShadows(
      light: _theme.primaryColorLight,
      dark: _theme.primaryColorDark,
    ),
  );
}
