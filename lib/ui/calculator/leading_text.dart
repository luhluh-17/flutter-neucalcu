import 'package:flutter/material.dart';
import 'package:neucalcu/providers/animate.dart';
import 'package:neucalcu/providers/calculate.dart';
import 'package:neucalcu/themes/dimensions.dart';
import 'package:provider/provider.dart';

class LeadingText extends StatefulWidget {
  @override
  _LeadingTextState createState() => _LeadingTextState();
}

class _LeadingTextState extends State<LeadingText>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    context.read<Animate>().leadingController = _controller;

    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn)
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    Color _primaryText = _textTheme.headline1.color;
    Color _secondaryText = _textTheme.bodyText1.color;

    final _sizeTween = Tween(begin: sizeHeadline1, end: sizeSubtitle1);
    final ColorTween _colorTween =
        ColorTween(begin: _primaryText, end: _secondaryText);

    return FittedBox(
      fit: BoxFit.fitWidth,
      child: Text(
        '${context.watch<Calculate>().expression}',
        style: TextStyle(
          color: _colorTween.evaluate(_animation),
          fontSize: _sizeTween.evaluate(_animation),
        ),
      ),
    );
  }
}
