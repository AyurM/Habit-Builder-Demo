import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'add_reminder_dialog_state.dart';

class AddReminderDialogCubit extends Cubit<AddReminderDialogState> {
  AddReminderDialogCubit() : super(AddReminderDialogInitial());

  bool _isAm = true;
  bool get isAm => _isAm;

  int _hour = 0;
  int _minute = 0;

  TimeOfDay get result => TimeOfDay(hour: _hour, minute: _minute);

  void setAmPmMode(bool am) {
    if (_isAm == am) {
      return;
    }
    _isAm = am;
    _hour += _isAm ? -12 : 12;
  }

  void onHourChanged(int newValue) {
    _hour = newValue == 11 ? 0 : newValue + 1;

    if (!_isAm) {
      _hour += 12;
    }
  }

  // ignore: use_setters_to_change_properties
  void onMinuteChanged(int newValue) {
    _minute = newValue;
  }
}
