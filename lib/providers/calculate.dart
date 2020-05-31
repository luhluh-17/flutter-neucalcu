import 'package:flutter/foundation.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:neucalcu/models/record.dart';

class Calculate with ChangeNotifier {
  static String _instructions = 'Enter your equation';
  String _equation = _instructions;
  String _result = '';

  String get equation => _equation;

  String get result => _result;

  getButtonText({String buttonValue}) {
    if (buttonValue == 'AC') {
      _clearInput();
    } else if (buttonValue == 'Del') {
      _deleteLast();
    } else if (buttonValue == "=") {
      _displayAnswer();
    } else {
      _getButtonText(buttonValue);
    }
    notifyListeners();
  }

  _clearInput() {
    _equation = '0';
    _result = '';
  }

  _deleteLast() {
    if (equation == _instructions) {
      _clearInput();
    }
    _equation = equation.substring(0, equation.length - 1);
    _calculateExpression(isPreviewActive: true);
    if (equation == '') {
      _clearInput();
    }
  }

  _displayAnswer() {
    if (result == 'Answer') {
      _removeCommaSeparator();
    }
    _calculateExpression(isPreviewActive: false);

    if (!(result == 'Syntax Error')) {
      String temp = equation;
      String answer = _equation = _result;
      _result = 'Answer';
      _saveRecord(answer: answer, equation: temp);
    }
  }

  _saveRecord({String answer, String equation}) {
    if (answer != equation) {
      DateTime now = new DateTime.now();
      DateFormat formatter = new DateFormat('MMMM dd, yyyy');
      String formattedDate = formatter.format(now);

      Record record = Record(
        answer: answer,
        equation: equation,
        date: formattedDate,
      );

      Hive.box<Record>(boxRecord).add(record);
    }
  }

  _calculateExpression({bool isPreviewActive}) {
    String tempEquation = equation.replaceAll(',', '');
    String expression = tempEquation;
    expression = expression.replaceAll('×', '*');
    expression = expression.replaceAll('÷', '/');

    try {
      Parser p = Parser();
      Expression exp = p.parse(expression);

      ContextModel context = ContextModel();
      _result = '${exp.evaluate(EvaluationType.REAL, context)}';

      String tempResult = result.replaceAll(',', '');

      FlutterMoneyFormatter fmf = FlutterMoneyFormatter(
        amount: double.parse(tempResult),
        settings: MoneyFormatterSettings(
          fractionDigits: _getDecimalLength(),
        ),
      );

      _result = fmf.output.nonSymbol.toString();
    } catch (e) {
      if (!isPreviewActive) {
        _result = 'Syntax Error';
      }
    }
  }

  _getButtonText(String buttonValue) {
    _removeCommaSeparator();
    if (equation == '0' || equation == _instructions) {
      _equation = buttonValue;
    } else {
      _equation = equation + buttonValue;
    }
    _calculateExpression(isPreviewActive: true);
  }

  _removeCommaSeparator() {
    String tempEquation = equation.replaceAll(',', '');
    _equation = tempEquation;
  }

  int _getDecimalLength() {
    int startIndex = result.indexOf('.') + 1;
    int endIndex = result.length;

    String decimal = result.substring(startIndex, endIndex);

    if (result.contains('.') && result.endsWith('0')) {
      return 0;
    } else {
      return decimal.length;
    }
  }
}
