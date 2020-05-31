import 'package:flutter/material.dart';
import 'package:neucalcu/providers/calculate.dart';
import 'package:neucalcu/themes/colors.dart';
import 'package:neucalcu/themes/dimensions.dart';
import 'package:provider/provider.dart';

class DisplayScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        FittedBox(
          fit: BoxFit.fitWidth,
          child: Text(
            '${context.watch<Calculate>().equation}',
            style: TextStyle(
              color: AppColors.primaryText,
              fontSize: sizeCustom1,
            ),
          ),
        ),
        Text(
          '${context.watch<Calculate>().result}',
          style: TextStyle(
            color: AppColors.secondaryText,
            fontSize: sizeSubHead2,
          ),
        ),
      ],
    );
  }
}
