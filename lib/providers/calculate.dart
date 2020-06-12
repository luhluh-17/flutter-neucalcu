import 'package:flutter/material.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:hive/hive.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:neucalcu/models/record.dart';
import 'package:provider/provider.dart';

import 'animate.dart';

class Calculate with ChangeNotifier {
  String _equation = '0';
  String _answer = ' ';

  String get equation => _equation;

  String get answer => _answer;

  getButtonText({BuildContext context, String buttonValue}) {
    if (buttonValue == 'AC') {
      _clearInput();
    } else if (buttonValue == 'Del') {
      _deleteLast();
    } else if (buttonValue == '=') {
      _displayAnswer(context: context);
    } else {
      _getButtonText(buttonValue);
    }

    final animate = context.read<Animate>();
    if (buttonValue != '=' && animate.showAnswer) {
      animate.showAnswer = false;
      animate.reverseAnimation(controller: animate.leadingController);
      animate.reverseAnimation(controller: animate.trailingController);
    }

    notifyListeners();
  }

  _clearInput() {
    _equation = '0';
    _answer = ' ';
  }

  _deleteLast() {
    _equation = equation.substring(0, equation.length - 1);
    _calculateExpression(isPreviewActive: true);
    if (equation == '') {
      _clearInput();
    }
  }

  _displayAnswer({BuildContext context}) {
    if (answer == 'Answer') {
      _removeCommaSeparator();
    }
    _calculateExpression(isPreviewActive: false);

    final animate = context.read<Animate>();

    if (answer != 'Syntax Error' && !animate.showAnswer) {
      animate.showAnswer = true;
      animate.startAnimation(controller: animate.leadingController);
      animate.startAnimation(controller: animate.trailingController);

      _saveRecord(answer: answer, equation: equation);
    }
  }

  _saveRecord({String answer, String equation}) {
    if (answer != equation) {
      DateTime currentDateTime = new DateTime.now();

      Record record = Record(
        answer: answer,
        equation: equation,
        date: currentDateTime.toString(),
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
      _answer = '${exp.evaluate(EvaluationType.REAL, context)}';

      String tempResult = answer.replaceAll(',', '');

      FlutterMoneyFormatter fmf = FlutterMoneyFormatter(
        amount: double.parse(tempResult),
        settings: MoneyFormatterSettings(
          fractionDigits: _getDecimalLength(),
        ),
      );

      _answer = fmf.output.nonSymbol.toString();
    } catch (e) {
      if (!isPreviewActive) {
        _answer = 'Syntax Error';
      }
    }
  }

  _getButtonText(String buttonValue) {
    _removeCommaSeparator();
    if (equation == '0') {
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
    int startIndex = answer.indexOf('.') + 1;
    int endIndex = answer.length;

    String decimal = answer.substring(startIndex, endIndex);

    if (answer.contains('.') && answer.endsWith('0')) {
      return 0;
    } else {
      return decimal.length;
    }
  }

  // Settings
  getDataFromRecords({String answer, String equation, String date}) {
    _equation = answer;
    _answer = equation;
    notifyListeners();
  }
}
