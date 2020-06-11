import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:neucalcu/models/record.dart';
import 'package:neucalcu/ui/widgets/custom_icon_button.dart';

class RecordAppbar extends StatelessWidget {
  final recordBox = Hive.box<Record>(boxRecord);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 25.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            CustomIconButton(
              icon: LineAwesomeIcons.arrow_left,
              onPressed: () => Navigator.pop(context),
            ),
            Text(
              'Record History',
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  .apply(color: Colors.white54),
            ),
            CustomIconButton(
              icon: LineAwesomeIcons.trash,
              onPressed: () {
                recordBox..clear();
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ],
    );
  }
}
