import 'package:flutter/material.dart';
import 'package:neucalcu/models/record.dart';
import 'package:neucalcu/themes/dimensions.dart';
import 'package:neucalcu/tools/util.dart';

import 'record_container.dart';

class RecordListBuilder extends StatelessWidget {
  final box;

  RecordListBuilder({@required this.box});

  @override
  Widget build(BuildContext context) {
    List<Record> recordList = getReversedList(box: box);
    return Expanded(
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(sizeBody1),
        itemCount: recordList.length,
        separatorBuilder: (_, index) => SizedBox(height: 24.0),
        itemBuilder: (_, index) {
          final Record record = recordList[index];
          return RecordContainer(record: record);
        },
      ),
    );
  }
}
