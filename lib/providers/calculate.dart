import 'package:flutter/foundation.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculate with ChangeNotifier {
  String _equation = '0';
  String _result = '';

  String get equation => _equation;

  String get result => _result;

  void getButtonText({String buttonValue}) {
    if (buttonValue == 'AC') {
      _clearInput();
    } else if (buttonValue == 'Del') {
      _deleteEquation();
    } else if (buttonValue == "=") {
      _calculateExpression(isPreviewActive: false);

      _equation = _result;
      _result = 'Answer';
    } else {
      _getButtonText(buttonValue);
    }
    notifyListeners();
  }

  void _clearInput() {
    _equation = '0';
    _result = '';
  }

  void _deleteEquation() {
    if (_equation == 'Syntax Error') {
      _clearInput();
    } else {
      _equation = equation.substring(0, equation.length - 1);
      _calculateExpression(isPreviewActive: true);
      if (equation == '') {
        _equation = '0';
        _result = '';
      }
    }
  }

  void _calculateExpression({bool isPreviewActive}) {
    String _expression = equation;
    _expression = _expression.replaceAll('×', '*');
    _expression = _expression.replaceAll('÷', '/');

    try {
      Parser p = Parser();
      Expression exp = p.parse(_expression);

      ContextModel context = ContextModel();
      _result = '${exp.evaluate(EvaluationType.REAL, context)}';

    } catch (e) {
      if (!isPreviewActive) {
        _result = 'Syntax Error';
      }
    }
  }

  void _getButtonText(String buttonValue) {
    if (equation == '0') {
      _equation = buttonValue;
    } else {
      _equation = equation + buttonValue;
    }
    _calculateExpression(
      isPreviewActive: true,
    );
    RegExp regExp = RegExp(r"[+-/*(]");
    _calculateExpression(
      isPreviewActive: regExp.hasMatch(_result),
    );
  }
}
