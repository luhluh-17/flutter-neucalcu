import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:neucalcu/models/record.dart';
import 'package:neucalcu/providers/calculate.dart';
import 'package:neucalcu/themes/colors.dart';
import 'package:neucalcu/themes/dimensions.dart';
import 'package:neucalcu/themes/shadows.dart';
import 'package:neucalcu/widgets/display_screen.dart';
import 'package:provider/provider.dart';

class RecordContainer extends StatefulWidget {
  final Record record;

  RecordContainer({this.record});

  @override
  _RecordContainerState createState() => _RecordContainerState();
}

class _RecordContainerState extends State<RecordContainer> {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 112.0,
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        padding: EdgeInsets.all(16.0),
        decoration: getOuterShadow(radius: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  getFormattedDate(date: widget.record.date),
                  style: TextStyle(color: AppColors.accent),
                ),
              ],
            ),
            SizedBox(height: 8.0),
            Expanded(
              child: GestureDetector(
                onTap: (){
                  context.read<Calculate>().getDataFromRecords(
                      answer: widget.record.answer,
                      equation: widget.record.equation,
                      date: widget.record.date);
                  Navigator.pop(context);
                },
                child: DisplayScreen(
                  leadingText: widget.record.answer,
                  fontSizeLeading: sizeHeadline2,
                  trailingText: widget.record.equation,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String getFormattedDate({String date}) {
    DateTime dateTime = DateTime.parse(date);
    DateFormat formatter = new DateFormat('MMMM dd, yyyy');
    String formattedDate = formatter.format(dateTime);

    return formattedDate;
  }
}
