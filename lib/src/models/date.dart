import 'dart:math';
import 'package:date_generator/src/models/weekday.dart';

/// A placeholder class that represents an entity or model.
class Date {
  static const List<int> hundrendsTable = [3, 1, 6, 4];
  static Random random = Random();
  static const List<int> specialDaysForMonth = [
    3,
    28,
    14,
    4,
    9,
    6,
    11,
    8,
    5,
    10,
    7,
    12
  ];

  static const List<int> daysInMonth = [
    31,
    28,
    31,
    30,
    31,
    30,
    31,
    31,
    30,
    31,
    30,
    31,
  ];

  static const List<String> monthsNames = [
    "January",
    "Febuary",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December",
  ];

  Date(this.year, this.month, this.day);

  static Date today() {
    var now = DateTime.now();
    return Date(now.year, now.month - 1, now.day - 1);
  }

  static Date generated({int start = 1400, int end = 3000}) {
    int year = random.nextInt(end - start) + start;
    int month = random.nextInt(12);
    int hundrends = year ~/ 100;
    int remainder = year % 100;
    bool isLeapYear =
        remainder % 4 == 0 && (remainder != 0 || hundrends % 4 == 0);
    int maxDays = daysInMonth[month] + (month == 1 && isLeapYear ? 1 : 0);
    int day = random.nextInt(maxDays);

    return Date(year, month, day);
  }

  int calculateWeekDate() {
    int hundrends = year ~/ 100;
    int remainder = year % 100;
    bool isAddedDay =
        remainder % 4 == 0 && (remainder != 0 || hundrends % 4 == 0);
    int specialDay =
        (hundrendsTable[hundrends % 4] + remainder ~/ 4 + remainder) % 7;

    int monthDay =
        specialDaysForMonth[month] + ((month <= 1 && isAddedDay) ? 1 : 0);
    return (specialDay + (day - monthDay)) % 7;
  }

  int year;
  int month;
  int day;

  String get monthName => monthsNames[month];

  WeekDay get weekDay => WeekDay.values[calculateWeekDate()];
}
