import 'package:intl/intl.dart';

String getFormattedDate({String date}) {
  DateTime dateTime = DateTime.parse(date);
  DateFormat formatter = new DateFormat('MMMM dd, yyyy K:mm a');
  String formattedDate = formatter.format(dateTime);

  return formattedDate;
}