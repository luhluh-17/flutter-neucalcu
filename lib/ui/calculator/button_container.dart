import 'package:flutter/material.dart';
import 'package:neucalcu/ui/widgets/constant/colors.dart';
import 'package:neucalcu/ui/widgets/constant/dimensions.dart';

import 'widgets/calculator_button.dart';

class ButtonContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color _danger = AppColors.danger;
    Color _primaryText = Theme.of(context).textTheme.headline1.color;
    final _theme = Theme.of(context);

    return Column(
      children: <Widget>[
        ButtonRow(
          children: [
            CalculatorButton(text: '7', color: _primaryText),
            CalculatorButton(text: '8', color: _primaryText),
            CalculatorButton(text: '9', color: _primaryText),
            CalculatorButton(text: 'Del', color: _danger),
            CalculatorButton(text: 'AC', color: _danger),
          ],
        ),
        ButtonRow(
          children: [
            CalculatorButton(text: '4', color: _primaryText),
            CalculatorButton(text: '5', color: _primaryText),
            CalculatorButton(text: '6', color: _primaryText),
            CalculatorButton(
              text: '×',
              color: _theme.accentColor,
              fontSize: sizeHeadline4,
            ),
            CalculatorButton(
              text: '÷',
              color: _theme.accentColor,
              fontSize: sizeHeadline4,
            ),
          ],
        ),
        ButtonRow(
          children: [
            CalculatorButton(text: '1', color: _primaryText),
            CalculatorButton(text: '2', color: _primaryText),
            CalculatorButton(text: '3', color: _primaryText),
            CalculatorButton(
              text: '+',
              color: _theme.accentColor,
              fontSize: sizeHeadline4,
            ),
            CalculatorButton(
              text: '-',
              color: _theme.accentColor,
              fontSize: sizeHeadline4,
            ),
          ],
        ),
        ButtonRow(
          children: [
            CalculatorButton(text: '0', color: _primaryText),
            CalculatorButton(
              text: '(',
              color: _theme.accentColor,
              fontSize: sizeHeadline6,
            ),
            CalculatorButton(
              text: ')',
              color: _theme.accentColor,
              fontSize: sizeHeadline6,
            ),
            CalculatorButton(
              text: '.',
              color: _theme.accentColor,
              fontSize: sizeHeadline3,
            ),
            CalculatorButton(
              text: '=',
              color: _danger,
              fontSize: sizeHeadline4,
            ),
          ],
        ),
      ],
    );
  }
}

class ButtonRow extends StatelessWidget {
  final children;

  ButtonRow({this.children});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: children,
      ),
    );
  }
}
