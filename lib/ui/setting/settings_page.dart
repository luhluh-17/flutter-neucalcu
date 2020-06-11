import 'package:flutter/material.dart';
import 'package:flutter_circle_color_picker/flutter_circle_color_picker.dart';
import 'package:neucalcu/themes/dimensions.dart';
import 'package:neucalcu/ui/setting/neumorphic_pie.dart';
import 'package:neucalcu/ui/setting/settings_appbar.dart';

class SettingsPage extends StatefulWidget {
  static const String id = '/settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  Color _currentColor = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(sizeBody1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            SettingsAppbar(),
            Expanded(
              child: Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    CircleContainer(),
                    CircleColorPicker(
                      initialColor: _currentColor,
                      onChanged: _onColorChanged,
                      strokeWidth: 12.0,
                      thumbSize: 40.0,
                      size: Size(255,255),
                      colorCodeBuilder: (context, color) {
                        return Text(
                          ' ',
                          style: TextStyle(fontSize: 24),
                        );
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _onColorChanged(Color color) {
    setState(() => _currentColor = color);
  }
}
