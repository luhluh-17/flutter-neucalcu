import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:neucalcu/models/record.dart';
import 'package:provider/provider.dart';

import 'animate.dart';

const String _error = 'Syntax Error';

class Calculate with ChangeNotifier {
  // FittedBox that has a child Text that has a empty String returns error
  // Solution: add white space in text
  String _result = ' ';
  String _expression = '';

  // trailing text
  String get result => _result;

  // leading text
  String get expression => _getExpression();

  // Record History
  getDataFromRecords({String result, String expression, String date}) {
    _result = result;
    _expression = expression;
    notifyListeners();
  }

  getButtonText({BuildContext context, String buttonValue}) {
    if (buttonValue == 'AC') {
      _clearInput();
    } else if (buttonValue == 'Del') {
      _deleteLast();
    } else if (buttonValue == '=') {
      _animateResult(context);
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

  String _getExpression() {
    String exp = _formatOutput(_expression);
    return (exp == '') ? '0' : exp;
  }

  _clearInput() {
    _result = ' ';
    _expression = '';
  }

  // TODO implement method in onLongTap
  _deleteLast({bool calculate = true}) {
    _expression = _expression.substring(0, _expression.length - 1);
    if (_expression == '') {
      _clearInput();
    }

    // calculates expression if necessary
    if (calculate) {
      _result = _getResult();
    }
  }

  _animateResult(BuildContext context) {
    _result = _getResult(showError: true);

    final animate = context.read<Animate>();

    if (result != _error && !animate.showAnswer) {
      _saveRecord();
      animate.showAnswer = true;
      animate.startAnimation(controller: animate.leadingController);
      animate.startAnimation(controller: animate.trailingController);
    }
  }

  _saveRecord() {
    if (result != _expression) {
      Record record = Record(
        result: result,
        expression: expression,
        date: DateTime.now().toString(),
      );

      Hive.box<Record>(boxRecord).add(record);
    }
  }

  // calculates expression
  String _getResult({bool showError = false}) {
    // removes comma
    String placeholder = _expression.replaceAll(',', '');
    // replaces special operator symbols
    placeholder = placeholder.replaceAll('×', '*');
    placeholder = placeholder.replaceAll('÷', '/');

    // digits that has (
    RegExp regExp = RegExp(r'\d+\(');
    if (regExp.hasMatch(placeholder)) {
      // Math Expression package limitation
      // unable to compute n(n)
      placeholder = placeholder.replaceAllMapped(regExp, (match) {
        // adds multiplication operator before open parenthesis
        String value = placeholder.substring(match.start, match.end);
        return value.replaceAll('(', '*(');
      });
    }
    try {
      // Math Expression Package
      Expression exp = Parser().parse(placeholder);
      ContextModel context = ContextModel();
      double answer = exp.evaluate(EvaluationType.REAL, context);
      int length = _getDecimalLength(answer);
      return _formatOutput(answer.toStringAsFixed(length));
    } catch (e) {
      // return previous result
      return showError ? _error : result;
    }
  }

  int _getDecimalLength(double value) {
    String text = value.toString();
    if (!text.endsWith('.0')) {
      int startIndex = text.indexOf('.') + 1;
      int endIndex = text.length;
      String decimal = text.substring(startIndex, endIndex);
      return decimal.length;
    } else {
      // removes unwanted decimals if numbers in the expression are integers
      return 0;
    }
  }

  _getButtonText(String buttonValue) {
    // any operator excluding -
    RegExp regExp = RegExp(r'[÷×+]$');
    if (expression == '0' && regExp.hasMatch(buttonValue)) {
      // _expression += buttonValue will not work
      // _getExpression() returns exp if string not empty
      // thus _expression will only return buttonValue
      _expression = '0' + buttonValue;
      return;
    }

    // prevents spamming of operators
    if (regExp.hasMatch(expression) && regExp.hasMatch(buttonValue)) {
      _deleteLast(calculate: false);
    }

    // dot and decimal numbers at the end of text
    RegExp regExp2 = RegExp(r'\.((\d+)|[÷×+-])?$');
    // prevents multiple frequency of .
    if (regExp2.hasMatch(expression) && buttonValue == '.') {
      return;
    }

    // math operators excluding -
    RegExp regExp3 = RegExp(r'[÷×+]$');
    // prevents operators after -
    if (expression.endsWith('-') && regExp3.hasMatch(buttonValue)) {
      return;
    }

    // prevents spamming of -
    if (expression.endsWith('-') && buttonValue == '-') {
      return;
    }

    // only allow input of ) to the number of ( that was used
    if (frequency('(') <= frequency(')') && buttonValue == ')') {
      return;
    }

    _expression += buttonValue;
    _result = _getResult();
  }

  int frequency(String value) {
    int count = 0;
    for (int i = 0; i < expression.length; i++) {
      if (value == expression[i]) {
        count++;
      }
    }
    return count;
  }

  // TODO needs improvement
  // find a better way to select only whole numbers
  String _formatOutput(String text) {
    // all digits
    RegExp regExp1 = RegExp(r'\d+');

    // First Pattern: replaces match patterns to custom string
    String first = text.replaceAllMapped(regExp1, (match) {
      String value = text.substring(match.start, match.end);
      return _commaSeparator(value);
    });

    // decimal values that has comma separator
    RegExp regExp2 = RegExp(r'\.(\d{1,3},)+(\d+)?');

    // Last Pattern: removes comma in decimal places
    String last = first.replaceAllMapped(regExp2, (match) {
      String value = first.substring(match.start, match.end);
      return value.replaceAll(',', '');
    });

    return last;
  }

  String _commaSeparator(String text) {
    // hundreds separator
    RegExp regExp = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');

    // add comma in match patterns
    String output = text.replaceAllMapped(regExp, (match) {
      String matchValue = text.substring(match.start, match.end);
      return '$matchValue,';
    });

    return output;
  }
}
