import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:neucalcu/models/record.dart';
import 'package:neucalcu/tools/util.dart';
import 'package:provider/provider.dart';

import 'animate.dart';

class Calculate with ChangeNotifier {
  String _result = ' ';
  String _equation = '0';

  String get result => _result;

  String get equation => _equation;

  getButtonText({BuildContext context, String buttonValue}) {
    if (buttonValue == 'AC') {
      _clearInput();
    } else if (buttonValue == 'Del') {
      _deleteLast();
    } else if (buttonValue == '=') {
      _displayAnswer(context);
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
    _result = ' ';
  }

  _deleteLast() {
    _equation = equation.substring(0, equation.length - 1);
    _calculateExpression(enablePreview: true);
    if (equation == '') {
      _clearInput();
    }
  }

  _displayAnswer(BuildContext context) {
    _calculateExpression(enablePreview: false);

    final animate = context.read<Animate>();

    if (result != 'Syntax Error' && !animate.showAnswer) {
      animate.showAnswer = true;
      animate.startAnimation(controller: animate.leadingController);
      animate.startAnimation(controller: animate.trailingController);
      _saveRecord();
    }
  }

  _saveRecord() {
    if (result != equation) {
      Record record = Record(
        answer: result,
        equation: equation,
        date: DateTime.now().toString(),
      );

      Hive.box<Record>(boxRecord).add(record);
    }
  }

  _calculateExpression({bool enablePreview}) {
    String expression;
    expression = equation.replaceAll(',', '');
    expression = expression.replaceAll('×', '*');
    expression = expression.replaceAll('÷', '/');

    try {
      Parser p = Parser();
      Expression exp = p.parse(expression);

      ContextModel context = ContextModel();
      _result = exp.evaluate(EvaluationType.REAL, context).toString();
      _result = result.replaceAll(',', '');
      _result = addCommaSeparator(text: result);
    } catch (e) {
      if (!enablePreview) {
        _result = 'Syntax Error';
      }
    }
  }

  _getButtonText(String buttonValue) {
    _equation = (equation == '0') ? buttonValue : equation + buttonValue;
    _calculateExpression(enablePreview: true);
  }

  // Settings
  getDataFromRecords({String answer, String equation, String date}) {
    _equation = answer;
    _result = equation;
    notifyListeners();
  }
}
