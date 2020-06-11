import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:neucalcu/models/record.dart';
import 'package:neucalcu/themes/colors.dart';
import 'package:neucalcu/themes/dimensions.dart';
import 'package:neucalcu/ui/calculator/calculator_appbar.dart';

import 'button_container.dart';
import 'leading_text.dart';
import 'trailing_text.dart';

class CalculatorPage extends StatefulWidget {
  static const String id = '/calculator';

  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(
          statusBarColor: Colors.transparent,
          systemNavigationBarColor: AppColors.primaryDark),
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(sizeBody1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              CalculatorAppbar(),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    LeadingText(),
                    TrailingText(),
                  ],
                ),
              ),
              ButtonContainer(),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    Hive.box<Record>(boxRecord)
      ..compact()
      ..close();
    super.dispose();
  }
}
