import 'package:flutter/material.dart';
import 'package:neucalcu/models/record.dart';
import 'package:neucalcu/themes/dimensions.dart';

import 'record_container.dart';

class RecordListBuilder extends StatelessWidget {
  final box;

  RecordListBuilder({@required this.box});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        padding: EdgeInsets.all(sizeBody1),
        physics: BouncingScrollPhysics(),
        itemCount: box.length,
        separatorBuilder: (_, index) => SizedBox(height: 24.0),
        itemBuilder: (_, index) {
          final Record record = box.get(index);
          return RecordContainer(record: record);
        },
      ),
    );
  }
}