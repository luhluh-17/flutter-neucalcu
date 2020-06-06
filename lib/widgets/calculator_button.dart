import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neucalcu/providers/calculate.dart';
import 'package:neucalcu/themes/colors.dart';
import 'package:neucalcu/themes/shadows.dart';
import 'package:neucalcu/themes/dimensions.dart';
import 'package:provider/provider.dart';

class CalculatorButton extends StatefulWidget {
  final String text;
  final Color color;
  final double fontSize;

  CalculatorButton({
    this.text,
    this.color = AppColors.primaryText,
    this.fontSize = sizeSubtitle1,
  });

  @override
  _CalculatorButtonState createState() => _CalculatorButtonState();
}

class _CalculatorButtonState extends State<CalculatorButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final _buttonSize = MediaQuery.of(context).size.width / 6.5;

    final TextStyle _buttonStyle = GoogleFonts.montserrat(
        fontSize: widget.fontSize,
        fontWeight: FontWeight.w400,
        color: _isPressed ? widget.color.withOpacity(0.8) : widget.color);

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
              decoration: _isPressed ? getInnerShadow() : getOuterShadow(),
            ),
            Center(
              child: Text(widget.text, style: _buttonStyle),
            ),
          ],
        ),
      ),
    );
  }
}
