import 'package:flutter/material.dart';
import 'package:neucalcu/models/record.dart';
import 'package:neucalcu/ui/widgets/constant/dimensions.dart';
import 'package:neucalcu/utils/utilities.dart';

import 'widgets/record_container.dart';

class RecordListBuilder extends StatelessWidget {
  final box;

  RecordListBuilder({@required this.box});

  @override
  Widget build(BuildContext context) {
    List<Record> _recordList = getReversedList(box: box);
    return Expanded(
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(appPadding),
        itemCount: _recordList.length,
        separatorBuilder: (_, index) => SizedBox(height: 24.0),
        itemBuilder: (_, index) {
          final Record record = _recordList[index];
          return RecordContainer(record: record);
        },
      ),
    );
  }
}
