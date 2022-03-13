extension DateTimeExtension on DateTime {
  bool get isToday {
    final DateTime now = DateTime.now();
    return year == now.year && month == now.month && day == now.day;
  }

  List<DateTime> getDaysOfTheWeek() {
    final List<DateTime> result = [];
    for (int i = 0; i < 7; i++) {
      result.add(subtract(Duration(days: weekday - 1 - i)));
    }
    return result;
  }
}
