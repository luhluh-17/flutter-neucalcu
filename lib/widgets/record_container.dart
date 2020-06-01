import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:neucalcu/models/record.dart';
import 'package:neucalcu/providers/calculate.dart';
import 'package:neucalcu/themes/colors.dart';
import 'package:neucalcu/themes/dimensions.dart';
import 'package:neucalcu/themes/shadows.dart';
import 'package:neucalcu/widgets/display_screen.dart';
import 'package:provider/provider.dart';

class RecordContainer extends StatefulWidget {
  final Record record;

  RecordContainer({this.record});

  @override
  _RecordContainerState createState() => _RecordContainerState();
}

class _RecordContainerState extends State<RecordContainer> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.0,
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Listener(
        onPointerDown: (event) {
          setState(() => _isPressed = true);
        },
        onPointerUp: (event) {
          setState(() => _isPressed = false);
          context.read<Calculate>().getDataFromRecords(
              answer: widget.record.answer,
              equation: widget.record.equation,
              date: widget.record.date);
          Navigator.pop(context);
        },
        child: Stack(
          children: <Widget>[
            AnimatedContainer(
              duration: Duration(milliseconds: 100),
              decoration: _isPressed
                  ? getInnerShadow(radius: 16.0)
                  : getOuterShadow(radius: 16.0),
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        getFormattedDate(date: widget.record.date),
                        style: TextStyle(color: AppColors.accent),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  Hero(
                    tag: widget.record.date,
                    flightShuttleBuilder: (flightContext, animation,
                        flightDirection, fromHeroContext, toHeroContext) {
                      return DefaultTextStyle(
                        style: DefaultTextStyle.of(toHeroContext).style,
                        child: toHeroContext.widget,
                      );
                    },
                    child: DisplayScreen(
                      leadingText: widget.record.answer,
                      fontSizeLeading: sizeHeadline2,
                      trailingText: widget.record.equation,
                      fontSizeTrailing: sizeDefault,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  String getFormattedDate({String date}) {
    DateTime dateTime = DateTime.parse(date);
    DateFormat formatter = new DateFormat('MMMM dd, yyyy');
    String formattedDate = formatter.format(dateTime);

    return formattedDate;
  }
}
