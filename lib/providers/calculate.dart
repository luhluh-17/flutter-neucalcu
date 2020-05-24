import 'package:flutter/foundation.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculate with ChangeNotifier {
  String _equation = '0';
  String _result = '';
  String _expression = '';

  String get equation => _equation;

  String get result => _result;

  void getButtonText({String buttonValue}) {
    if (buttonValue == 'AC') {
      _clearInput();
    } else if (buttonValue == 'Del') {
      _deleteLast();
    } else if (buttonValue == 'Ans') {
    } else if (buttonValue == "=") {
      _calculateExpression(isPreviewOn: false);
    } else {
      _getButtonText(buttonValue);
    }
    notifyListeners();
  }

  void _clearInput() {
    _equation = '0';
    _result = '';
  }

  void _deleteLast() {
    _equation = equation.substring(0, equation.length - 1);
    _calculateExpression(isPreviewOn: true);
    if (equation == '') {
      _equation = '0';
      _result = '';
    }
  }

  void _calculateExpression({bool isPreviewOn}) {
    _expression = equation;
    _expression = _expression.replaceAll('×', '*');
    _expression = _expression.replaceAll('÷', '/');

    try {
      Parser p = Parser();
      Expression exp = p.parse(_expression);

      ContextModel context = ContextModel();
      _result = '${exp.evaluate(EvaluationType.REAL, context)}';

      String last = _result[_result.length - 1];

      if (last == '0') {
        _result = _result.substring(0, _result.length - 2);
      }

      if(_expression == _result){
        if(!_result.startsWith('-')){
          _result = '';
        }
      }

      if (!isPreviewOn) {
        _equation = _result;
        _result = 'Answer';
      }
    } catch (e) {
      if (!isPreviewOn) {
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
    _calculateExpression(isPreviewOn: true);
  }
}
