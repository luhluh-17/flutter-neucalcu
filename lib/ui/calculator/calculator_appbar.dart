import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:neucalcu/tools/util.dart';
import 'package:neucalcu/ui/record/records_page.dart';
import 'package:neucalcu/ui/setting/settings_page.dart';
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
            CustomIconButton(
              icon: LineAwesomeIcons.cog,
              size: 25.0,
              onPressed: () => Navigator.pushNamed(
                context,
                SettingsPage.id,
              ),
            ),
            Text('NeuCalcu', style: appBarStyle(context)),
            CustomIconButton(
              icon: LineAwesomeIcons.history,
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
