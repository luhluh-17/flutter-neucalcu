import 'package:flutter/material.dart';
import 'package:neucalcu/models/record.dart';
import 'package:neucalcu/providers/calculate.dart';
import 'package:neucalcu/themes/colors.dart';
import 'package:neucalcu/themes/dimensions.dart';
import 'package:neucalcu/themes/shadows.dart';
import 'package:neucalcu/util/utils.dart';
import 'package:provider/provider.dart';

class RecordContainer extends StatelessWidget {
  final Record record;

  RecordContainer({this.record});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: double.infinity,
      child: Container(
        padding: EdgeInsets.all(12.0),
        decoration: getOuterShadow(radius: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  getFormattedDate(date: record.date),
                  style: TextStyle(color: AppColors.accent),
                ),
              ],
            ),
            SizedBox(height: 8.0),
            Expanded(
              child: InkWell(
                onTap: () {
                  context.read<Calculate>().getDataFromRecords(
                        answer: record.answer,
                        equation: record.equation,
                        date: record.date,
                      );
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
                        style: TextStyle(
                          color: AppColors.primaryText,
                          fontSize: sizeHeadline5,
                        ),
                      ),
                    ),
                    Text(
                      record.equation,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: AppColors.secondaryText,
                        fontSize: sizeSubtitle1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
