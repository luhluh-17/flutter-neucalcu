import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neucalcu/providers/calculate.dart';
import 'package:neucalcu/themes/colors.dart';
import 'package:neucalcu/themes/shadows.dart';
import 'package:neucalcu/themes/text_size.dart';
import 'package:provider/provider.dart';

class CalculatorButton extends StatefulWidget {
  final String text;
  final Color color;
  final double fontSize;

  CalculatorButton({
    this.text,
    this.color = AppColors.primaryText,
    this.fontSize = sizeSubHead2,
  });

  @override
  _CalculatorButtonState createState() => _CalculatorButtonState();
}

class _CalculatorButtonState extends State<CalculatorButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _buttonSize = _width / 6.5;
    final _radius = 16.0;

    BoxDecoration _outerShadow = BoxDecoration(
      borderRadius: BorderRadius.circular(_radius),
      color: AppColors.baseColor,
      boxShadow: [
        BoxShadow(
          blurRadius: 15,
          offset: -Offset(4, 4),
          color: AppColors.lightShadow,
        ),
        BoxShadow(
          blurRadius: 15,
          offset: Offset(4, 4),
          color: AppColors.darkShadow,
        ),
      ],
    );

    return SizedBox(
      height: _buttonSize,
      width: _buttonSize,
      child: Listener(
        onPointerDown: (event) {
          setState(() => _isPressed = true);
          context.read<Calculate>().getButtonText(buttonValue: widget.text);
        },
        onPointerUp: (event) {
          setState(() => _isPressed = false);
        },
        child: Stack(
          children: <Widget>[
            AnimatedContainer(
              duration: Duration(milliseconds: 100),
              decoration: _isPressed ? kInnerShadow : _outerShadow,
            ),
            Center(
              child: Text(
                widget.text,
                style: GoogleFonts.montserrat(
                    fontSize: widget.fontSize,
                    fontWeight: FontWeight.w400,
                    color: _isPressed ? widget.color.withOpacity(0.8) : widget.color),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
