import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:neucalcu/widgets/button_container.dart';
import 'package:neucalcu/widgets/display_screen.dart';
import 'package:neucalcu/themes/colors.dart';
import 'package:neucalcu/themes/text_size.dart';

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
          padding: EdgeInsets.all(_padding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'NeuCalcu',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: sizeSubHead2,
                    ),
                  ),

                ],
              ),
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
