import 'package:flutter/material.dart';
import 'package:neucalcu/themes/dimensions.dart';
import 'package:neucalcu/ui/setting/settings_appbar.dart';

class SettingsPage extends StatelessWidget {
  static const String id = '/settings';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(sizeBody1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            SettingsAppbar()
          ],
        ),
      ),
    );
  }
}
