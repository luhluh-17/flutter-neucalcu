import 'package:flutter/material.dart';
import 'package:neucalcu/themes/colors.dart';

class InnerRing extends StatelessWidget {
  final double width;

  const InnerRing({@required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: width,
      width: width,
      decoration: BoxDecoration(
        color: AppColors.primary,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Container(
          height: width * 0.3,
          width: width * 0.3,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                offset: Offset(-1.5, -1.5),
                color: AppColors.primaryDark,
                spreadRadius: 4.0,
              ),
              BoxShadow(
                offset: Offset(1.5, 1.5),
                color: AppColors.primaryLight,
                spreadRadius: 2.0,
                blurRadius: 4,
              )
            ],
          ),
        ),
      ),
    );
  }
}
