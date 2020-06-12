import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:neucalcu/tools/util.dart';
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
              icon: LineAwesomeIcons.arrow_left,
              size: 25.0,
              onPressed: () => Navigator.pop(context),
            ),
            Text('Color Settings', style: appBarStyle(context)),
            CustomIconButton(
              icon: LineAwesomeIcons.info_circle,
              size: 25.0,
              onPressed: () => buildShowAboutDialog(context),
            ),
          ],
        ),
      ],
    );
  }

  void buildShowAboutDialog(BuildContext context) {
    const double _size = 54;
    const String _appName = 'NeuCalcu';
    const String _appVersion = '1.2.0';
    const String _message =
        'NeuCalcu is a Flutter calculator application that uses Neumorphic Design';

    return showAboutDialog(
      context: context,
      applicationVersion: _appVersion,
      applicationName: _appName,
      applicationIcon: Center(
        child: SizedBox(
          width: _size,
          height: _size,
          child: Image.asset('assets/logo.png'),
        ),
      ),
      children: [
        Text(_message),
      ],
    );
  }
}
