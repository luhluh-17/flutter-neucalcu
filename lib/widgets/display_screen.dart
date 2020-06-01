import 'package:flutter/material.dart';
import 'package:neucalcu/themes/colors.dart';
import 'package:neucalcu/themes/dimensions.dart';

class DisplayScreen extends StatelessWidget {
  final String leadingText;
  final double fontSizeLeading;
  final String trailingText;
  final double fontSizeTrailing;

  DisplayScreen({
    this.leadingText,
    this.fontSizeLeading = sizeCustom1,
    this.trailingText,
    this.fontSizeTrailing = sizeSubHead2,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        FittedBox(
          fit: BoxFit.fitWidth,
          child: Text(
            leadingText,
            style: TextStyle(
              color: AppColors.primaryText,
              fontSize: fontSizeLeading,
            ),
          ),
        ),
        Text(
          trailingText,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: AppColors.secondaryText,
            fontSize: fontSizeTrailing,
          ),
        ),
      ],
    );
  }
}
