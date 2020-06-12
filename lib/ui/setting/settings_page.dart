import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_circle_color_picker/flutter_circle_color_picker.dart';
import 'package:neucalcu/providers/color_provider.dart';
import 'package:neucalcu/themes/dimensions.dart';
import 'package:neucalcu/tools/util.dart';
import 'package:neucalcu/ui/setting/inner_ring.dart';
import 'package:neucalcu/ui/setting/neumorphic_pie.dart';
import 'package:neucalcu/ui/setting/settings_appbar.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  static const String id = '/settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    Color _selectedColor = Theme.of(context).primaryColor;
    bool _isDarkMode = context.watch<ColorProvider>().isDarkMode;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: getSystemUI(
        appTheme: _isDarkMode,
        navBarColor: _theme.primaryColorDark,
      ),
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(sizeBody1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              SettingsAppbar(),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        CircleContainer(),
                        buildColorPicker(_selectedColor),
                        InnerRing(),
                      ],
                    ),
                    SizedBox(height: sizeSubtitle1),
                    Text(
                      '*Select a darker color for better effect*',
                      style: _theme.textTheme.subtitle2.copyWith(
                        fontStyle: FontStyle.italic,
                        color: _theme.textTheme.bodyText1.color,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  buildColorPicker(Color color) {
    return CircleColorPicker(
      initialColor: color,
      thumbSize: 40.0,
      strokeWidth: 12.0,
      size: Size(255, 255),
      onChanged: (color) {
        final provider = context.read<ColorProvider>();
        provider.updatePrimaryColor(color);
      },
      colorCodeBuilder: (context, color) =>
          Text('', style: TextStyle(fontSize: 24.0)),
    );
  }
}
