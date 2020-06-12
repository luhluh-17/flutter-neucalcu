import 'package:flutter/material.dart';
import 'package:neucalcu/models/record.dart';
import 'package:neucalcu/providers/animate.dart';
import 'package:neucalcu/providers/calculate.dart';
import 'package:neucalcu/themes/shadows.dart';
import 'package:neucalcu/tools/util.dart';
import 'package:provider/provider.dart';

class RecordContainer extends StatelessWidget {
  final Record record;

  RecordContainer({this.record});

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    final _textTheme = _theme.textTheme;
    return Container(
      height: 120,
      width: double.infinity,
      padding: EdgeInsets.all(12.0),
      decoration: getOuterShadow(
        radius: 15.0,
        primary: _theme.primaryColor,
        lightShadow: _theme.primaryColorLight,
        darkShadow: _theme.primaryColorDark,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                getFormattedDate(date: record.date),
                style: TextStyle(color: _theme.accentColor),
              ),
            ],
          ),
          SizedBox(height: 8.0),
          Expanded(
            child: InkWell(
              onTap: () {
                final calculate = context.read<Calculate>();
                calculate.getDataFromRecords(
                  answer: record.answer,
                  equation: record.equation,
                  date: record.date,
                );
                final animate = context.read<Animate>();
                animate.showAnswer = false;
                animate.reverseAnimation(controller: animate.leadingController);
                animate.reverseAnimation(
                    controller: animate.trailingController);
                Navigator.pop(context);
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      record.answer,
                      style: _textTheme.headline5
                          .copyWith(color: _textTheme.headline1.color),
                    ),
                  ),
                  Text(
                    record.equation,
                    overflow: TextOverflow.ellipsis,
                    style: _textTheme.bodyText1,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
