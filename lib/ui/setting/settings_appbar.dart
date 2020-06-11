import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:neucalcu/themes/dimensions.dart';
import 'package:neucalcu/ui/record/records_page.dart';
import 'package:neucalcu/ui/widgets/custom_icon_button.dart';

class SettingsAppbar extends StatelessWidget {
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
              icon: LineAwesomeIcons.angle_left,
              size: 25.0,
              onPressed: () => Navigator.pop(context),
            ),
            Text(
              'Settings',
              style: TextStyle(
                color: Colors.white54,
                fontSize: sizeSubtitle1,
              ),
            ),
            SizedBox(
              height: 40.0,
              width: 40.0,
            )
          ],
        ),
      ],
    );
  }
}
