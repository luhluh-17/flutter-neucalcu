import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:neucalcu/models/record.dart';
import 'package:neucalcu/ui/widgets/constant/dimensions.dart';

import 'record_appbar.dart';
import 'record_list_builder.dart';

class RecordsPage extends StatelessWidget {
  static const String id = '/records';
  final _recordBox = Hive.box<Record>(boxRecord);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              left: appPadding,
              top: appPadding,
              right: appPadding,
            ),
            child: RecordAppbar(),
          ),
          SizedBox(height: 24.0),
          _recordBox.length >= 1
              ? RecordListBuilder(box: _recordBox)
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
