part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeHabitsLoaded extends HomeState {
  final List<Habit> habits;

  const HomeHabitsLoaded(this.habits);

  @override
  List<Object> get props => [habits];
}

class HomeMenuPressed extends HomeState {
  final String message;

  const HomeMenuPressed(this.message);

  @override
  List<Object> get props => [message];
}

class HomeProfilePressed extends HomeState {
  final String message;

  const HomeProfilePressed(this.message);

  @override
  List<Object> get props => [message];
}

class HomeError extends HomeState {
  final String message;

  const HomeError(this.message);

  @override
  List<Object> get props => [message];
}
