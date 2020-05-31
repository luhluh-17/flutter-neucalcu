import 'package:flutter/material.dart';
import 'package:neucalcu/components/neumorphic_button.dart';
import 'package:neucalcu/themes/colors.dart';
import 'package:neucalcu/themes/text_size.dart';

class ButtonContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ButtonRow(
          children: [
            NeuButton(text: '7'),
            NeuButton(text: '8'),
            NeuButton(text: '9'),
            NeuButton(
              text: 'Del',
              color: AppColors.danger,
            ),
            NeuButton(
              text: 'AC',
              color: AppColors.danger,
            ),
          ],
        ),
        ButtonRow(
          children: [
            NeuButton(text: '4'),
            NeuButton(text: '5'),
            NeuButton(text: '6'),
            NeuButton(
              text: '×',
              color: AppColors.accent,
              fontSize: sizeHeadline1,
            ),
            NeuButton(
              text: '÷',
              color: AppColors.accent,
              fontSize: sizeHeadline1,
            ),
          ],
        ),
        ButtonRow(
          children: [
            NeuButton(text: '1'),
            NeuButton(text: '2'),
            NeuButton(text: '3'),
            NeuButton(
              text: '+',
              color: AppColors.accent,
              fontSize: sizeHeadline1,
            ),
            NeuButton(
              text: '-',
              color: AppColors.accent,
              fontSize: sizeHeadline1,
            ),
          ],
        ),
        ButtonRow(
          children: [
            NeuButton(text: '0'),
            NeuButton(
              text: '(',
              color: AppColors.accent,
              fontSize: sizeSubHead1,
            ),
            NeuButton(
              text: ')',
              color: AppColors.accent,
              fontSize: sizeSubHead1,
            ),
            NeuButton(
              text: '.',
              color: AppColors.accent,
              fontSize: sizeDisplay,
            ),
            NeuButton(
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
