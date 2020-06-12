import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:neucalcu/ui/record/records_page.dart';
import 'package:neucalcu/ui/setting/settings_page.dart';
import 'package:neucalcu/ui/widgets/appbar_text.dart';
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
            AppbarText(text: 'NeuCalcu'),
            Spacer(),
            CustomIconButton(
              icon: LineAwesomeIcons.history,
              size: 25.0,
              onPressed: () => Navigator.pushNamed(
                context,
                RecordsPage.id,
              ),
            ),
            SizedBox(width: 20.0),
            CustomIconButton(
              icon: LineAwesomeIcons.cog,
              size: 25.0,
              onPressed: () => Navigator.pushNamed(
                context,
                SettingsPage.id,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
