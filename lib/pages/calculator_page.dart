import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:neucalcu/widgets/button_container.dart';
import 'package:neucalcu/widgets/custom_icon_button.dart';
import 'package:neucalcu/widgets/display_screen.dart';
import 'package:neucalcu/themes/colors.dart';
import 'package:neucalcu/themes/dimensions.dart';

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
              SizedBox(height: 30.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'NeuCalcu',
                    style: TextStyle(
                      color: Colors.white54,
                      fontSize: sizeSubHead2,
                    ),
                  ),
                  CustomIconButton(
                    icon: Icon(Icons.settings),
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
