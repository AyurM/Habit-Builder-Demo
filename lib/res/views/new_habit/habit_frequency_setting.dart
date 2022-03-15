import 'package:flutter/material.dart';
import 'package:habit_builder_demo/data/model/habit.dart';
import 'package:habit_builder_demo/res/colors/colors.dart';
import 'package:habit_builder_demo/res/views/habit_list/habit_date_item.dart';
import 'package:habit_builder_demo/res/views/habit_list/habit_value_item.dart';
import 'package:habit_builder_demo/res/views/new_habit/add_habit_action.dart';
import 'package:habit_builder_demo/utils/datetime_utils.dart';

class HabitFrequencySetting extends StatelessWidget {
  final List<HabitFrequency> values;
  final void Function()? onCustomPressed;

  const HabitFrequencySetting(
      {Key? key, required this.values, this.onCustomPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<DateTime> daysOfTheWeek = DateTime.now().getDaysOfTheWeek();

    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: Column(children: [
        AddHabitAction(
            title: 'Habit Frequency',
            action: 'Custom',
            onPressed: onCustomPressed),
        Container(
          height: 1,
          color: Theme.of(context).colorScheme.background,
        ),
        LayoutBuilder(
            builder: (context, constraints) => Row(
                children: _buildValues(
                    daysOfTheWeek, values, context, constraints.maxWidth)))
      ]),
    );
  }

  List<Widget> _buildValues(List<DateTime> days, List<HabitFrequency> values,
      BuildContext context, double width) {
    final List<Widget> result = [];
    for (int i = 0; i < days.length; i++) {
      result.add(_HabitFrequencySettingItem(
          day: days[i], value: values[i], width: width / days.length));
    }
    return result;
  }
}

class _HabitFrequencySettingItem extends StatelessWidget {
  final DateTime day;
  final HabitFrequency value;
  final double width;

  const _HabitFrequencySettingItem(
      {Key? key, required this.day, required this.value, required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    const EdgeInsets padding = EdgeInsets.all(8);

    return Container(
        width: width,
        decoration: BoxDecoration(
            border: Border(right: BorderSide(color: colorScheme.background))),
        padding: padding,
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Text(HabitDateItem.dayFormat.format(day).toUpperCase(),
              style: Theme.of(context)
                  .textTheme
                  .subtitle2
                  ?.copyWith(color: eclipse.withOpacity(0.5))),
          const SizedBox(height: 4),
          HabitValueItem(
            value: value,
            color: colorScheme.primary,
            size: width - padding.left - padding.right,
            margin: EdgeInsets.zero,
          )
        ]));
  }
}
