import 'package:flutter/material.dart';
import 'package:habit_builder_demo/data/model/habit.dart';
import 'package:habit_builder_demo/res/colors/colors.dart';
import 'package:habit_builder_demo/res/views/habit_list/habit_date_item.dart';
import 'package:habit_builder_demo/res/views/habit_list/habit_name_item.dart';
import 'package:habit_builder_demo/res/views/habit_list/habit_value_item.dart';
import 'package:habit_builder_demo/utils/datetime_utils.dart';

const double _defaultHeaderHeight = 50;
const double _defaultItemHeight = 70;
const double _defaultSpacing = 8;

class HabitList extends StatelessWidget {
  final List<Habit> habits;
  final EdgeInsets? margin;

  const HabitList({Key? key, required this.habits, this.margin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double totalHeight = _defaultHeaderHeight +
        habits.length * (_defaultItemHeight + _defaultSpacing);

    return Container(
        padding: margin ?? const EdgeInsets.only(left: 20),
        height: totalHeight,
        width: width,
        child: Row(
          children: [
            _HabitNameList(habits: habits, width: width * 0.28),
            Expanded(child: _HabitValueList(habits: habits))
          ],
        ));
  }
}

class _HabitNameList extends StatelessWidget {
  final List<Habit> habits;
  final double width;

  const _HabitNameList({Key? key, required this.habits, required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        children: [_buildTitle(context), ..._buildHabitNames()],
      );

  Widget _buildTitle(BuildContext context) => Container(
        height: _defaultHeaderHeight,
        width: width,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text('Habits'.toUpperCase(),
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  ?.copyWith(fontWeight: FontWeight.bold)),
        ),
      );

  List<Widget> _buildHabitNames() {
    final List<Widget> result = [];
    for (final habit in habits) {
      result.add(const SizedBox(height: _defaultSpacing));
      result.add(HabitNameItem(
          name: habit.name, width: width, height: _defaultItemHeight));
    }
    return result;
  }
}

class _HabitValueList extends StatelessWidget {
  final List<Habit> habits;

  const _HabitValueList({Key? key, required this.habits}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<DateTime> daysOfTheWeek = DateTime.now().getDaysOfTheWeek();
    final double totalHeight = _defaultHeaderHeight +
        habits.length * (_defaultItemHeight + _defaultSpacing);

    return SizedBox(
      height: totalHeight,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Column(
          children: [_buildHabitDates(daysOfTheWeek), ..._buildHabitValues()],
        ),
      ),
    );
  }

  Widget _buildHabitDates(List<DateTime> dates) => Container(
        height: _defaultHeaderHeight,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: dates
              .map((date) => HabitDateItem(
                  day: date,
                  size: _defaultHeaderHeight,
                  isSelected: date.isToday))
              .toList(),
        ),
      );

  List<Widget> _buildHabitValues() {
    final List<Widget> result = [];
    final List<Color> colors = [primaryColor, sunset, twilight, eclipse];

    for (int i = 0; i < habits.length; i++) {
      result.add(const SizedBox(height: _defaultSpacing));
      result.add(_HabitValueRow(
          values: habits[i].values, color: colors[i % colors.length]));
    }
    return result;
  }
}

class _HabitValueRow extends StatelessWidget {
  final List<HabitFrequency> values;
  final Color color;

  const _HabitValueRow({Key? key, required this.values, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        height: _defaultItemHeight,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
                left: BorderSide(
                    color: Theme.of(context).colorScheme.background))),
        child: Row(
          children: values
              .map((value) => HabitValueItem(
                  value: value, color: color, size: _defaultHeaderHeight + 4))
              .toList(),
        ),
      );
}
