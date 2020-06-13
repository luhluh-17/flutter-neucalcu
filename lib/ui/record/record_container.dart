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

    return Container(
      height: 120,
      width: double.infinity,
      padding: EdgeInsets.all(12.0),
      decoration: getOuterShadow(context, radius: 15.0),
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
                Navigator.pop(context);
                context.read<Animate>().containerAnimation();
                context.read<Calculate>().getDataFromRecords(
                      answer: record.answer,
                      equation: record.equation,
                      date: record.date,
                    );
              },
              child: RecordText(record: record),
            ),
          ),
        ],
      ),
    );
  }
}

class RecordText extends StatelessWidget {
  RecordText({@required this.record});

  final Record record;

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        FittedBox(
          fit: BoxFit.fitWidth,
          child: Text(
            record.answer,
            style: _textTheme.headline5.copyWith(
              color: _textTheme.headline1.color,
            ),
          ),
        ),
        Text(
          record.equation,
          overflow: TextOverflow.ellipsis,
          style: _textTheme.bodyText1,
        ),
      ],
    );
  }
}
