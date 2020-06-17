import 'package:flutter/material.dart';
import 'package:neucalcu/ui/widgets/concave_decoration.dart';

const double _radius = 24.0;
const double _blurRadius = 12.0;

List<BoxShadow> _shadows({@required Color light, @required Color dark}) {
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

ConcaveDecoration innerShadow(BuildContext context,
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

BoxDecoration outerShadow(BuildContext context, {double radius = _radius}) {
  final _theme = Theme.of(context);

  return BoxDecoration(
    borderRadius: BorderRadius.circular(radius),
    color: _theme.primaryColor,
    boxShadow: _shadows(
      light: _theme.primaryColorLight,
      dark: _theme.primaryColorDark,
    ),
  );
}

BoxDecoration outerShadowCircle(BuildContext context) {
  final _theme = Theme.of(context);
  return BoxDecoration(
    shape: BoxShape.circle,
    color: _theme.primaryColor,
    boxShadow: _shadows(
      light: _theme.primaryColorLight,
      dark: _theme.primaryColorDark,
    ),
  );
}

BoxDecoration innerShadowCircle(BuildContext context) {
  final _theme = Theme.of(context);
  return BoxDecoration(
    shape: BoxShape.circle,
    boxShadow: [
      BoxShadow(
        color: _theme.primaryColorLight,
        spreadRadius: 20,
        blurRadius: 45,
        offset: Offset(0, 8), // changes position of shadow
      ),
    ],
  );
}
