import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:neucalcu/components/neumorphic_button.dart';
import 'package:neucalcu/themes/colors.dart';
import 'package:neucalcu/themes/text_size.dart';

class CalculatorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.transparent,
      ),
      child: Material(
        color: AppColors.baseColor,
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Spacer(),
              Text(
                'Equation',
                style: TextStyle(
                  color: AppColors.primaryText,
                  fontSize: kDisplay,
                ),
              ),
              Text(
                'Result',
                style: TextStyle(
                  color: AppColors.primaryText,
                  fontSize: kHeadline1,
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    NeuButton(text: '7'),
                    NeuButton(text: '8'),
                    NeuButton(text: '9'),
                    NeuButton(
                      text: 'Del',
                      color: AppColors.accent,
                    ),
                    NeuButton(
                      text: 'AC',
                      color: AppColors.accent,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    NeuButton(text: '4'),
                    NeuButton(text: '5'),
                    NeuButton(text: '6'),
                    NeuButton(
                      text: '×',
                      color: AppColors.accent,
                      fontSize: kHeadline1,
                    ),
                    NeuButton(
                      text: '÷',
                      color: AppColors.accent,
                      fontSize: kHeadline1,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    NeuButton(text: '1'),
                    NeuButton(text: '2'),
                    NeuButton(text: '3'),
                    NeuButton(
                      text: '+',
                      color: AppColors.accent,
                      fontSize: kHeadline1,
                    ),
                    NeuButton(
                      text: '-',
                      color: AppColors.accent,
                      fontSize: kHeadline1,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    NeuButton(text: '0'),
                    NeuButton(text: '.'),
                    NeuButton(text: 'EXP'),
                    NeuButton(
                      text: 'Ans',
                      color: AppColors.accent,
                    ),
                    NeuButton(
                      text: '=',
                      color: AppColors.accent,
                      fontSize: kHeadline1,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
