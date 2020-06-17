import 'package:flutter/material.dart';
import 'package:neucalcu/providers/calculate.dart';
import 'package:neucalcu/ui/widgets/constant/dimensions.dart';
import 'package:neucalcu/ui/widgets/shadows.dart';
import 'package:provider/provider.dart';

class CalculatorButton extends StatefulWidget {
  final String text;
  final Color color;
  final double fontSize;

  CalculatorButton({
    this.text,
    this.color,
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

    return SizedBox(
      height: _buttonSize,
      width: _buttonSize,
      child: Listener(
        onPointerDown: (event) {
          final provider = context.read<Calculate>();
          setState(() => _isPressed = true);
          provider.startCalculator(
            context: context,
            buttonText: widget.text,
          );
        },
        onPointerUp: (event) {
          setState(() => _isPressed = false);
        },
        child: Stack(
          children: <Widget>[
            NeumorphicAnimation(isPressed: _isPressed),
            Center(
              child: Text(
                widget.text,
                style: TextStyle(
                  fontSize: widget.fontSize,
                  fontWeight: _isPressed ? FontWeight.w900 : FontWeight.w400,
                  color:
                      _isPressed ? widget.color.withOpacity(0.8) : widget.color,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NeumorphicAnimation extends StatelessWidget {
  final bool _isPressed;

  NeumorphicAnimation({@required bool isPressed}) : _isPressed = isPressed;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 100),
      decoration:
          _isPressed ? innerShadow(context) : outerShadow(context),
    );
  }
}
