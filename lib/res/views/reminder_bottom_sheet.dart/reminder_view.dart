import 'package:flutter/material.dart';
import 'package:habit_builder_demo/data/model/reminder_data.dart';
import 'package:habit_builder_demo/res/colors/colors.dart';
import 'package:habit_builder_demo/res/views/app_switch_button.dart';
import 'package:intl/intl.dart';

class ReminderView extends StatefulWidget {
  final ReminderData data;
  final void Function(int, bool)? onChanged;

  static DateFormat timeFormat = DateFormat('h:mm a');

  const ReminderView({Key? key, required this.data, this.onChanged})
      : super(key: key);

  @override
  State<ReminderView> createState() => _ReminderViewState(data.active);
}

class _ReminderViewState extends State<ReminderView> {
  _ReminderViewState(bool isActive) : active = isActive;

  bool active;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color backgroundColor =
        active ? colorScheme.background : const Color(0xFFC8C1C8);
    final Color fontColor = active ? colorScheme.primary : eclipse;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: backgroundColor),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(ReminderView.timeFormat.format(widget.data.dateTime),
              style: Theme.of(context)
                  .textTheme
                  .button
                  ?.copyWith(fontSize: 18, color: fontColor),
              textAlign: TextAlign.center),
          const SizedBox(height: 16),
          AppSwitchButton(
              initialValue: active,
              onChanged: (value) {
                setState(() {
                  active = value;
                });
                widget.onChanged?.call(widget.data.id, value);
              }),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
