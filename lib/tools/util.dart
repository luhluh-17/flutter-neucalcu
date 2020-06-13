import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:intl/intl.dart';

String getFormattedDate({String date}) {
  DateTime dateTime = DateTime.parse(date);
  DateFormat formatter = new DateFormat('MMMM dd, yyyy K:mm a');
  String formattedDate = formatter.format(dateTime);

  return formattedDate;
}

String addCommaSeparator({String text}) {
  FlutterMoneyFormatter fmf = FlutterMoneyFormatter(
    amount: double.parse(text),
    settings: MoneyFormatterSettings(
      fractionDigits: _getDecimalLength(text),
    ),
  );
  return fmf.output.nonSymbol.toString();
}

int _getDecimalLength(String answer) {
  int startIndex = answer.indexOf('.') + 1;
  int endIndex = answer.length;

  String decimal = answer.substring(startIndex, endIndex);
  return (answer.contains('.') && answer.endsWith('0')) ? 0 : decimal.length;
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