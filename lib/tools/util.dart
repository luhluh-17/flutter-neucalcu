import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:neucalcu/models/record.dart';

String getFormattedDate({String date}) {
  DateTime dateTime = DateTime.parse(date);
  DateFormat formatter = new DateFormat('MMMM dd, yyyy K:mm a');
  String formattedDate = formatter.format(dateTime);

  return formattedDate;
}

List getReversedList({box}) {
  List<Record> list = List<Record>();
  for (int i = 0; i < box.length; i++) {
    final Record record = box.get(i);
    list.add(record);
  }
  return list.reversed.toList();
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
