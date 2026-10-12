extension Conveter on DateTime {
  String get ddMmmmYYYY => '${padZero(day)}/${monthString(month)}/$year';

  int get dateForDB => int.parse('$year${padZero(month)}${padZero(day)}');

  String get uidForDB =>
      '${padZero(hour > 12 ? hour - 12 : hour)}:${padZero(minute)}:${padZero(second)}.$microsecond';

  String get hhmmss =>
      '${padZero(hour > 12 ? hour - 12 : hour)}:${padZero(minute)}:${padZero(second)} ${hour < 12 ? 'am' : 'pm'}';
}

String padZero(int num) {
  return num < 10 ? '0$num' : '$num';
}

String monthString(int month) {
  Map<int, String> data = {
    1: 'Jan',
    2: 'Feb',
    3: 'Mar',
    4: 'Apr',
    5: 'May',
    6: 'Jun',
    7: 'Jul',
    8: 'Aug',
    9: 'Sep',
    10: 'Oct',
    11: 'Nov',
    12: 'Dec',
  };
  return data[month]!;
}
