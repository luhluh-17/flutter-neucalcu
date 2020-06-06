import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:neucalcu/models/record.dart';
import 'package:neucalcu/pages/records_page.dart';
import 'package:neucalcu/providers/calculate.dart';
import 'package:neucalcu/widgets/button_container.dart';
import 'package:neucalcu/widgets/custom_icon_button.dart';
import 'package:neucalcu/widgets/display_screen.dart';
import 'package:neucalcu/themes/colors.dart';
import 'package:neucalcu/themes/dimensions.dart';
import 'package:provider/provider.dart';

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
        backgroundColor: AppColors.primary,
        body: Padding(
          padding: EdgeInsets.all(sizeBody1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              SizedBox(height: 25.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'NeuCalcu',
                    style: TextStyle(
                      color: Colors.white54,
                      fontSize: sizeSubtitle1,
                    ),
                  ),
                  CustomIconButton(
                    icon: Icons.history,
                    size: 25.0,
                    onPressed: () => Navigator.pushNamed(
                      context,
                      RecordsPage.id,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: DisplayScreen(
                  leadingText: '${context.watch<Calculate>().equation}',
                  trailingText: '${context.watch<Calculate>().answer}',
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
