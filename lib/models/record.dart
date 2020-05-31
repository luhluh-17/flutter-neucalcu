import 'package:hive/hive.dart';

part 'record.g.dart';

@HiveType(typeId: 0)
class Record {
  @HiveField(0)
  final String answer;
  @HiveField(1)
  final String equation;
  @HiveField(2)
  final String date;

  Record({this.answer, this.equation, this.date});
}