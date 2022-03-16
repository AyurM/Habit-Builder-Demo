import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:habit_builder_demo/data/model/habit.dart';
import 'package:habit_builder_demo/utils/validation/form_validators.dart';

part 'new_habit_state.dart';

class NewHabitCubit extends Cubit<NewHabitState> {
  NewHabitCubit() : super(NewHabitInitial());

  String? Function(String?) get nameValidator =>
      FormValidator.habitNameValidator;

  final List<HabitFrequency> values = [
    HabitFrequency.often,
    HabitFrequency.often,
    HabitFrequency.seldom,
    HabitFrequency.often,
    HabitFrequency.often,
    HabitFrequency.often,
    HabitFrequency.seldom
  ];

  void onHabitNamePressed() => emit(NewHabitHabitNamePressed());

  void onCustomFrequencyPressed() => emit(NewHabitCustomFrequencyPressed());

  void onReminderPressed() => emit(NewHabitReminderPressed());

  void onReminderDialogClosed() => emit(NewHabitReminderDialogClosed());

  void onNotificationSettingChanged(bool value) {}
}
