import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

String getFormattedDate({String date}) {
  DateTime dateTime = DateTime.parse(date);
  DateFormat formatter = new DateFormat('MMMM dd, yyyy K:mm a');
  String formattedDate = formatter.format(dateTime);

  return formattedDate;
}

SystemUiOverlayStyle getSystemUI({bool appTheme, Color navBarColor}) {
  return appTheme
      ? SystemUiOverlayStyle.dark.copyWith(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.dark,
    systemNavigationBarColor: navBarColor,
  )
      : SystemUiOverlayStyle.light.copyWith(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.light,
    systemNavigationBarColor: navBarColor,
  );
}

appBarStyle(BuildContext context) {
  final _textTheme = Theme.of(context).textTheme;
  return _textTheme.subtitle1.copyWith(
    color: _textTheme.headline1.color.withOpacity(0.55),
  );
}