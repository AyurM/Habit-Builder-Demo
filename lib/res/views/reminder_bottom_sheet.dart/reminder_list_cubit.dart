import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:habit_builder_demo/data/model/reminder_data.dart';

part 'reminder_list_state.dart';

class ReminderListCubit extends Cubit<ReminderListState> {
  ReminderListCubit() : super(ReminderListInitial());

  final DateTime now = DateTime.now();

  late final List<ReminderData> reminders = List<ReminderData>.generate(
      12,
      (index) => ReminderData(
          id: index,
          dateTime: DateTime(now.year, now.month, now.day,
              6 + (index / 2).floor(), (index % 2) * 30),
          active: index % 4 != 0));

  void onAddReminder() => emit(ReminderListAddReminder());

  void onAddReminderDialogClosed() =>
      emit(ReminderListAddReminderDialogClosed());

  void onReminderChanged(int reminderId, bool active) =>
      emit(ReminderListOnItemChanged(reminderId, active));

  void onReminderTimeSelected(TimeOfDay time) {
    final DateTime reminderDateTime =
        DateTime(now.year, now.month, now.day, time.hour, time.minute);
    final ReminderData newItem = ReminderData(
        id: reminders.length, dateTime: reminderDateTime, active: true);
    reminders.add(newItem);
    reminders.sort((a, b) => a.dateTime.compareTo(b.dateTime));
    emit(ReminderListItemAdded(newItem));
  }
}
