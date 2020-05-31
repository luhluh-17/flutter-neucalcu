import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:neucalcu/models/record.dart';
import 'package:neucalcu/themes/colors.dart';
import 'package:neucalcu/themes/dimensions.dart';
import 'package:neucalcu/widgets/custom_icon_button.dart';

class RecordsPage extends StatelessWidget {
  static const String id = '/records';

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.baseColor,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            SizedBox(height: 25.0),
            Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Container(
                  height: 40.0,
                  width: double.infinity,
                ),
                Positioned(
                  left: 0,
                  child: Hero(
                    tag: 'iconButton',
                    child: CustomIconButton(
                      Icons.arrow_back_ios,
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ),
                Text(
                  'Settings',
                  style: TextStyle(
                    color: Colors.white54,
                    fontSize: sizeSubHead2,
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: Hive.box<Record>('records').length,
                itemBuilder: (context, index) {
                  final Record record = Hive.box<Record>('records').get(index);
                  return ListTile(
                    title: Text(record.answer),
                    subtitle: Text(record.equation + ' ' + record.date),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
