import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:neucalcu/models/record.dart';
import 'package:neucalcu/themes/colors.dart';

import 'record_appbar.dart';
import 'record_list_builder.dart';

class RecordsPage extends StatelessWidget {
  static const String id = '/records';

  final recordBox = Hive.box<Record>(boxRecord);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Column(
        children: <Widget>[
          RecordAppbar(),
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
    return Expanded(
      child: Center(
        child: Text(
          'Empty Data',
          style: Theme.of(context).textTheme.headline3,
        ),
      ),
    );
  }
}
