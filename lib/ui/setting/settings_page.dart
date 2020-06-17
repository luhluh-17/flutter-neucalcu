import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:neucalcu/providers/color_provider.dart';
import 'package:neucalcu/ui/setting/settings_appbar.dart';
import 'package:neucalcu/ui/setting/settings_body.dart';
import 'package:neucalcu/ui/widgets/constant/dimensions.dart';
import 'package:neucalcu/utils/utilities.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  static const String id = '/settings';

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    bool _isDarkMode = context.watch<ColorProvider>().darkMode;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: getSystemUI(
        appTheme: _isDarkMode,
        navBarColor: _theme.primaryColorDark,
      ),
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(appPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              SettingsAppbar(),
              SettingsBody(),
            ],
          ),
        ),
      ),
    );
  }
}
