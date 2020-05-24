import 'package:flutter/material.dart';

class CalculatorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Spacer(),
            Text(
              'Equation',
              style: TextStyle(
                fontSize: 35,
              ),
            ),
            Text(
              'Result',
              style: TextStyle(fontSize: 30),
            ),
            Spacer(),
            Table(
              children: [
                TableRow(
                    children: [
                      Container(
                        margin: EdgeInsets.all(8.0),
                        color: Colors.grey,
                        child: Text('7', textAlign: TextAlign.center,),
                      ),
                      Container(
                        margin: EdgeInsets.all(8.0),
                        color: Colors.grey,
                        child: Text('8', textAlign: TextAlign.center,),
                      ),
                      Container(
                        margin: EdgeInsets.all(8.0),
                        color: Colors.grey,
                        child: Text('9', textAlign: TextAlign.center,),
                      ),
                      Container(
                        margin: EdgeInsets.all(8.0),
                        color: Colors.grey,
                        child: Text('DEL', textAlign: TextAlign.center,),
                      ),
                      Container(
                        margin: EdgeInsets.all(8.0),
                        color: Colors.grey,
                        child: Text('AC', textAlign: TextAlign.center,),
                      ),
                    ]
                ),
                TableRow(
                    children: [
                      Container(
                        margin: EdgeInsets.all(8.0),
                        color: Colors.grey,
                        child: Text('4', textAlign: TextAlign.center,),
                      ),
                      Container(
                        margin: EdgeInsets.all(8.0),
                        color: Colors.grey,
                        child: Text('5', textAlign: TextAlign.center,),
                      ),
                      Container(
                        margin: EdgeInsets.all(8.0),
                        color: Colors.grey,
                        child: Text('6', textAlign: TextAlign.center,),
                      ),
                      Container(
                        margin: EdgeInsets.all(8.0),
                        color: Colors.grey,
                        child: Text('×', textAlign: TextAlign.center,),
                      ),
                      Container(
                        margin: EdgeInsets.all(8.0),
                        color: Colors.grey,
                        child: Text('÷', textAlign: TextAlign.center,),
                      ),
                    ]
                ),
                TableRow(
                    children: [
                      Container(
                        margin: EdgeInsets.all(8.0),
                        color: Colors.grey,
                        child: Text('1', textAlign: TextAlign.center,),
                      ),
                      Container(
                        margin: EdgeInsets.all(8.0),
                        color: Colors.grey,
                        child: Text('2', textAlign: TextAlign.center,),
                      ),
                      Container(
                        margin: EdgeInsets.all(8.0),
                        color: Colors.grey,
                        child: Text('3', textAlign: TextAlign.center,),
                      ),
                      Container(
                        margin: EdgeInsets.all(8.0),
                        color: Colors.grey,
                        child: Text('+', textAlign: TextAlign.center,),
                      ),
                      Container(
                        margin: EdgeInsets.all(8.0),
                        color: Colors.grey,
                        child: Text('-', textAlign: TextAlign.center,),
                      ),
                    ]
                ),
                TableRow(
                    children: [
                      Container(
                        margin: EdgeInsets.all(8.0),
                        color: Colors.grey,
                        child: Text('0', textAlign: TextAlign.center,),
                      ),
                      Container(
                        margin: EdgeInsets.all(8.0),
                        color: Colors.grey,
                        child: Text(',', textAlign: TextAlign.center,),
                      ),
                      Container(
                        margin: EdgeInsets.all(8.0),
                        color: Colors.grey,
                        child: Text('EXP', textAlign: TextAlign.center,),
                      ),
                      Container(
                        margin: EdgeInsets.all(8.0),
                        color: Colors.grey,
                        child: Text('ANS', textAlign: TextAlign.center,),
                      ),
                      Container(
                        margin: EdgeInsets.all(8.0),
                        color: Colors.grey,
                        child: Text('=', textAlign: TextAlign.center,),
                      ),
                    ]
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
