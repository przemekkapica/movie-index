extension DateTimeExtension on DateTime {
  String get formatYYYY => year.toString();

  String get formatddMMYYY => '$day.$month.$year';
}
