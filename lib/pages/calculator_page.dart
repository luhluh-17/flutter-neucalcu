import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:neucalcu/components/button_container.dart';
import 'package:neucalcu/components/display_screen.dart';
import 'package:neucalcu/themes/colors.dart';

class CalculatorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const double _padding = 16.0;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.transparent,
      ),
      child: Material(
        color: AppColors.baseColor,
        child: Padding(
          padding: const EdgeInsets.only(
            left: _padding,
            right: _padding,
            bottom: _padding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Spacer(),
              DisplayScreen(),
              Spacer(),
              ButtonContainer(),
            ],
          ),
        ),
      ),
    );
  }
}
