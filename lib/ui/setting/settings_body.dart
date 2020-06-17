import 'package:flutter/material.dart';
import 'package:flutter_circle_color_picker/flutter_circle_color_picker.dart';
import 'package:neucalcu/providers/color_provider.dart';
import 'package:neucalcu/ui/widgets/constant/dimensions.dart';
import 'package:provider/provider.dart';

import 'widgets/inner_ring.dart';
import 'widgets/outer_ring.dart';

class SettingsBody extends StatefulWidget {
  @override
  _SettingsBodyState createState() => _SettingsBodyState();
}

class _SettingsBodyState extends State<SettingsBody> {
  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    Color _selectedColor = Theme.of(context).primaryColor;

    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Spacer(),
          Stack(
            alignment: Alignment.center,
            children: <Widget>[
              OuterRing(),
              buildColorPicker(_selectedColor),
              InnerRing(),
            ],
          ),
          SizedBox(height: sizeSubtitle1),
          Spacer(),
          Text(
            '*Select a darker color for better effect*',
            style: _theme.textTheme.subtitle2.copyWith(
              color: _theme.textTheme.bodyText1.color,
            ),
          ),
        ],
      ),
    );
  }

  CircleColorPicker buildColorPicker(Color color) {
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
