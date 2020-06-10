import 'package:flutter/material.dart';
import 'package:neucalcu/themes/dimensions.dart';
import 'package:neucalcu/ui/record/records_page.dart';
import 'package:neucalcu/ui/widgets/custom_icon_button.dart';

class CalculatorAppbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
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
      ],
    );
  }
}
