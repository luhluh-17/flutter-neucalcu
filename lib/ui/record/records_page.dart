import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:neucalcu/models/record.dart';
import 'package:neucalcu/themes/dimensions.dart';

import 'record_appbar.dart';
import 'record_list_builder.dart';

class RecordsPage extends StatelessWidget {
  static const String id = '/records';

  final recordBox = Hive.box<Record>(boxRecord);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              left: sizeBody1,
              top: sizeBody1,
              right: sizeBody1,
            ),
            child: RecordAppbar(),
          ),
          SizedBox(height: 24.0),
          recordBox.length >= 1
              ? RecordListBuilder(box: recordBox)
              : EmptyData()
        ],
      ),
    );
  }
}

class EmptyData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return Expanded(
      child: Center(
        child: Text(
          'Empty Data',
          style: _textTheme.headline3.copyWith(
            color: _textTheme.bodyText1.color,
          ),
        ),
      ),
    );
  }
}
