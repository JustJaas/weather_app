import 'package:intl/intl.dart';

String capitalizeFirstLetter(String text) {
  if (text.isEmpty) return "";

  final firstLetter = text.substring(0, 1);
  final remainingLetters = text.substring(1);

  return firstLetter.toUpperCase() + remainingLetters.toLowerCase();
}

String datesToString(dateTime) {
  final dayFormat = DateFormat('EEEE');
  final hourFormat = DateFormat('h');
  final minuteFormat = DateFormat('mm');
  final amPmFormat = DateFormat('a');

  final dayOfWeek = dayFormat.format(dateTime);
  final hour = hourFormat.format(dateTime);
  final minute = minuteFormat.format(dateTime);
  final amPm = amPmFormat.format(dateTime);

  String daySpanish = daySpanishConverter(dayOfWeek);

  return '$daySpanish ${dateTime.day}\n$hour:$minute $amPm';
}

String datesFullToString(DateTime dateTime) {
  final dayFormat = DateFormat('EEEE');
  final monthFormat = DateFormat('MMMM');
  final yearFormat = DateFormat('y');
  final hourFormat = DateFormat('h');
  final minuteFormat = DateFormat('mm');
  final amPmFormat = DateFormat('a');

  final dayOfWeek = dayFormat.format(dateTime);
  final month = monthFormat.format(dateTime);
  final year = yearFormat.format(dateTime);
  final hour = hourFormat.format(dateTime);
  final minute = minuteFormat.format(dateTime);
  final amPm = amPmFormat.format(dateTime);

  String monthSpanish = monthSpanishConverter(month);
  String daySpanish = daySpanishConverter(dayOfWeek);

  return '$daySpanish ${dateTime.day} de $monthSpanish del $year, $hour:$minute $amPm';
}

daySpanishConverter(String day) {
  Map<String, String> dayMap = {
    "Monday": "Lunes",
    "Tuesday": "Martes",
    "Wednesday": "Miércoles",
    "Thursday": "Jueves",
    "Friday": "Viernes",
    "Saturday": "Sábado",
    "Sunday": "Domingo",
  };
  return dayMap[day];
}

monthSpanishConverter(String month) {
  Map<String, String> monthMap = {
    "January": "Enero",
    "February": "Febrero",
    "March": "May",
    "April": "Abril",
    "May": "Mayo",
    "June": "Junio",
    "July": "Julio",
    "August": "Agosto",
    "September": "Setiembre",
    "Octuber": "Octubre",
    "November": "November",
    "December": "Diciembre",
  };
  return monthMap[month];
}
