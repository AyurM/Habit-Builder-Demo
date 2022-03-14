import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:habit_builder_demo/base/app_error.dart';

enum HabitFrequency { none, seldom, often }

HabitFrequency parseHabitFrequency(int value) {
  if (value < 0 || value >= HabitFrequency.values.length) {
    throw const AppException(AppErrorType.noData,
        message: 'Unsupported value of habit frequency');
  }

  return HabitFrequency.values[value];
}

class Habit {
  final String name;
  final List<HabitFrequency> values;

  const Habit({
    required this.name,
    required this.values,
  });

  factory Habit.fromMap(Map<String, dynamic> map) {
    return Habit(
      name: map['name'] ?? '',
      values: map['values'] == null
          ? []
          : List<HabitFrequency>.from(
              map['values']?.map((x) => parseHabitFrequency(x))),
    );
  }

  factory Habit.fromJson(String source) => Habit.fromMap(json.decode(source));

  @override
  String toString() => 'Habit(name: $name, values: $values)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Habit &&
        other.name == name &&
        listEquals(other.values, values);
  }

  @override
  int get hashCode => name.hashCode ^ values.hashCode;
}
