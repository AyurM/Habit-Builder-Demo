part of 'home_cubit.dart';

const String _homeTitle = 'Homepage';
const String _newHabitTitle = 'New Habit';

abstract class HomeState extends Equatable {
  final String title;

  const HomeState({this.title = _homeTitle});

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeAddNewHabitPressed extends HomeState {
  const HomeAddNewHabitPressed() : super(title: _newHabitTitle);
}

class HomeNewHabitAdded extends HomeState {
  final String name;

  const HomeNewHabitAdded(this.name);

  @override
  List<Object> get props => [name];
}

class HomeCancelNewHabit extends HomeState {}

class HomeHabitsLoaded extends HomeState {
  final List<Habit> habits;

  const HomeHabitsLoaded(this.habits);

  @override
  List<Object> get props => [habits];
}

class HomeMenuPressed extends HomeState {}

class HomeProfilePressed extends HomeState {}

class HomeError extends HomeState {
  final String message;

  const HomeError(this.message);

  @override
  List<Object> get props => [message];
}
