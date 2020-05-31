import 'package:flutter/material.dart';
import 'package:neucalcu/widgets/calculator_button.dart';
import 'package:neucalcu/themes/colors.dart';
import 'package:neucalcu/themes/dimensions.dart';

class ButtonContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ButtonRow(
          children: [
            CalculatorButton(text: '7'),
            CalculatorButton(text: '8'),
            CalculatorButton(text: '9'),
            CalculatorButton(
              text: 'Del',
              color: AppColors.danger,
            ),
            CalculatorButton(
              text: 'AC',
              color: AppColors.danger,
            ),
          ],
        ),
        ButtonRow(
          children: [
            CalculatorButton(text: '4'),
            CalculatorButton(text: '5'),
            CalculatorButton(text: '6'),
            CalculatorButton(
              text: '×',
              color: AppColors.accent,
              fontSize: sizeHeadline1,
            ),
            CalculatorButton(
              text: '÷',
              color: AppColors.accent,
              fontSize: sizeHeadline1,
            ),
          ],
        ),
        ButtonRow(
          children: [
            CalculatorButton(text: '1'),
            CalculatorButton(text: '2'),
            CalculatorButton(text: '3'),
            CalculatorButton(
              text: '+',
              color: AppColors.accent,
              fontSize: sizeHeadline1,
            ),
            CalculatorButton(
              text: '-',
              color: AppColors.accent,
              fontSize: sizeHeadline1,
            ),
          ],
        ),
        ButtonRow(
          children: [
            CalculatorButton(text: '0'),
            CalculatorButton(
              text: '(',
              color: AppColors.accent,
              fontSize: sizeSubHead1,
            ),
            CalculatorButton(
              text: ')',
              color: AppColors.accent,
              fontSize: sizeSubHead1,
            ),
            CalculatorButton(
              text: '.',
              color: AppColors.accent,
              fontSize: sizeDisplay,
            ),
            CalculatorButton(
              text: '=',
              color: AppColors.accent,
              fontSize: sizeHeadline1,
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
