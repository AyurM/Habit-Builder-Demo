part of 'new_habit_cubit.dart';

abstract class NewHabitState extends Equatable {
  const NewHabitState();

  @override
  List<Object> get props => [];
}

class NewHabitInitial extends NewHabitState {}

class NewHabitHabitNamePressed extends NewHabitState {}

class NewHabitCustomFrequencyPressed extends NewHabitState {}

class NewHabitReminderPressed extends NewHabitState {}

class NewHabitReminderDialogClosed extends NewHabitState {}
