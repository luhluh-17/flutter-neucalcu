import 'package:flutter/material.dart';
import 'package:neucalcu/providers/color_provider.dart';
import 'package:neucalcu/themes/colors.dart';
import 'package:provider/provider.dart';

class AppbarText extends StatelessWidget {
  final String text;

  const AppbarText({this.text});

  @override
  Widget build(BuildContext context) {
    bool _isDarkMode = context.watch<ColorProvider>().isDarkMode;

    return Text(
      text,
      style: Theme.of(context).textTheme.subtitle1.apply(
            color: _isDarkMode
                ? AppColors.darkPrimaryText.withOpacity(0.55)
                : AppColors.lightPrimaryText.withOpacity(0.55),
          ),
    );
  }
}
