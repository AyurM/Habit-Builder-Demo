part of 'reminder_list_cubit.dart';

abstract class ReminderListState extends Equatable {
  const ReminderListState();

  @override
  List<Object> get props => [];
}

class ReminderListInitial extends ReminderListState {}

class ReminderListAddReminder extends ReminderListState {}

class ReminderListAddReminderDialogClosed extends ReminderListState {}

class ReminderListItemAdded extends ReminderListState {
  final ReminderData item;

  const ReminderListItemAdded(this.item);

  @override
  List<Object> get props => [item];
}

class ReminderListOnItemChanged extends ReminderListState {
  final int id;
  final bool active;

  const ReminderListOnItemChanged(this.id, this.active);

  @override
  List<Object> get props => [id, active];
}
