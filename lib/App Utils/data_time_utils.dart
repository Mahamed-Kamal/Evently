import 'package:easy_localization/easy_localization.dart';

String formatDate(DateTime date) {
  DateFormat dateFormat = DateFormat("dd-MM-yyyy");
  return dateFormat.format(date);
}

String formatTime(DateTime time) {
  DateFormat dateFormat = DateFormat('hh:mm a');
  return dateFormat.format(time);
}

String formatDateToMonth(int milliseconds) {
  DateTime date = DateTime.fromMillisecondsSinceEpoch(milliseconds);
  return DateFormat("MMM").format(date);
}
