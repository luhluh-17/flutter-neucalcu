import 'package:hive/hive.dart';

part 'record.g.dart';

const String boxRecord = 'record';

@HiveType(typeId: 0)
class Record {
  @HiveField(0)
  final String result;
  @HiveField(1)
  final String expression;
  @HiveField(2)
  final String date;

  Record({this.result, this.expression, this.date});
}