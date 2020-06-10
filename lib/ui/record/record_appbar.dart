import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:neucalcu/models/record.dart';
import 'package:neucalcu/themes/dimensions.dart';
import 'package:neucalcu/ui/widgets/custom_icon_button.dart';

class RecordAppbar extends StatelessWidget {
  final recordBox = Hive.box<Record>(boxRecord);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 25.0),
        Padding(
          padding: EdgeInsets.only(
              left: sizeBody1, top: sizeBody1, right: sizeBody1),
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Container(
                height: 40.0,
                width: double.infinity,
              ),
              Positioned(
                left: 0,
                child: CustomIconButton(
                  icon: Icons.arrow_back_ios,
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              Text('Record History',
                  style: Theme.of(context).textTheme.subtitle2),
              Positioned(
                right: 0,
                child: CustomIconButton(
                  icon: Icons.delete,
                  onPressed: () {
                    recordBox..clear();
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
