import 'package:flutter/material.dart';
import 'package:neucalcu/themes/colors.dart';
import 'package:neucalcu/themes/dimensions.dart';

class EmptyData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Text(
          'Empty Data',
          style: TextStyle(
            color: AppColors.primaryText,
            fontSize: sizeHeadline1,
          ),
        ),
      ),
    );
  }
}
