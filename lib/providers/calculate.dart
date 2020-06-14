import 'package:flutter/material.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:hive/hive.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:neucalcu/models/record.dart';
import 'package:provider/provider.dart';

import 'animate.dart';

const String _error = 'Syntax Error';

class Calculate with ChangeNotifier {
  String _result = ' ';
  String _expression = '0';
  String _equation = '0';
  String _numbers = '';
  String _symbols = '';
  List<String> _equationList = List<String>();

  String get result => _result;

  String get expression => _expression;

  // Record History
  getDataFromRecords({String answer, String equation, String date}) {
    // The values stored in hive are reversed
    _equation = answer;
    _result = equation;
    notifyListeners();
  }

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
    _result = ' ';
    _expression = '0';
    _equation = '0';
    _numbers = '';
    _symbols = '';
    _equationList.clear();
  }

  _deleteLast() {
    _equation = _equation.substring(0, _equation.length - 1);
    _result = _calculateExpression(enablePreview: true);
    _equationList.removeLast();
    print('Equation: $_equation');
    print('List: ${_equationList.toString()}');
    if (_equation == '') {
      _clearInput();
    }
  }

  _displayAnswer(BuildContext context) {
    _result = _calculateExpression(enablePreview: false);

    final animate = context.read<Animate>();

    if (result != 'Syntax Error' && !animate.showAnswer) {
      animate.showAnswer = true;
      animate.startAnimation(controller: animate.leadingController);
      animate.startAnimation(controller: animate.trailingController);
      _saveRecord();
    }
  }

  _saveRecord() {
    if (result != _equation) {
      Record record = Record(
        answer: result,
        equation: _equation,
        date: DateTime.now().toString(),
      );

      Hive.box<Record>(boxRecord).add(record);
    }
  }

  String _calculateExpression({bool enablePreview}) {
    String answer;
    String placeholder;
    placeholder = _equation.replaceAll(',', '');
    placeholder = placeholder.replaceAll('×', '*');
    placeholder = placeholder.replaceAll('÷', '/');

    try {
      Parser p = Parser();
      Expression exp = p.parse(placeholder);
      ContextModel context = ContextModel();

      answer = exp.evaluate(EvaluationType.REAL, context).toString();
      answer = _addCommaSeparator(text: answer);
      return answer;
    } catch (e) {
      return enablePreview ? result : _error;
    }
  }

  _getButtonText(String buttonValue) {
    String lastValue = _equation[_equation.length - 1];
    _equation = (_equation == '0') ? buttonValue : _equation + buttonValue;
    _result = _calculateExpression(enablePreview: true);

    // any numbers from 0-9 with/without decimal values and .
    RegExp regExpNumbers = RegExp('(([0-9]*)?.?[0-9]+)|[.]');
    // not numbers from 0-9 and .
    RegExp regExpSymbols = RegExp('[^0-9.]');

    if (regExpNumbers.hasMatch(buttonValue)) {
      if (regExpSymbols.hasMatch(lastValue)) {
        _equationList.add(_symbols);
        _symbols = '';
      }
      _numbers += buttonValue;
    }

    if (regExpSymbols.hasMatch(buttonValue)) {
      if (regExpNumbers.hasMatch(lastValue)) {
        _numbers = _addCommaSeparator(text: _numbers);
        _equationList.add(_numbers);
        _numbers = '';
      }
      _symbols += buttonValue;
    }

    // Empty String returns error on Text inside a FittedBox widget
    _expression = (_getExpression() == '') ? ' ' : _getExpression() + _symbols;

    print('Numbers: $_numbers');
    print('if: ${_numbers != ''}');
    if (_numbers != '') {
      _expression += _addCommaSeparator(text: _numbers);
    }

    print('Symbols: $_symbols');
    print('List: ${_equationList.toString()}');
  }

  String _getExpression() {
    String exp = '';
    if (_equationList.isNotEmpty) {
      _equationList.forEach((value) => exp += value);
    }
    return exp;
  }

  String _addCommaSeparator({String text}) {
    if (text.endsWith('.')) {
      return text;
    } else {
      try {
        FlutterMoneyFormatter fmf = FlutterMoneyFormatter(
          amount: double.parse(text),
          settings: MoneyFormatterSettings(
            fractionDigits: _getDecimalLength(text),
          ),
        );
        return fmf.output.nonSymbol.toString();
      } catch (e) {
        return text;
      }
    }
  }

  int _getDecimalLength(String text) {
    if (text.indexOf('.') != -1) {
      int startIndex = text.indexOf('.') + 1;
      int endIndex = text.length;
      String decimal = text.substring(startIndex, endIndex);
      return (text.contains('.') && text.endsWith('0')) ? 0 : decimal.length;
    } else {
      return 0;
    }
  }
}
