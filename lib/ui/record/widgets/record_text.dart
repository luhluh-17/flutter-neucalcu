import 'package:flutter/material.dart';
import 'package:neucalcu/models/record.dart';

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
            record.result,
            style: _textTheme.headline5.copyWith(
              color: _textTheme.headline1.color,
            ),
          ),
        ),
        Text(
          record.expression,
          overflow: TextOverflow.ellipsis,
          style: _textTheme.bodyText1,
        ),
      ],
    );
  }
}
