import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:habit_builder_demo/data/model/habit.dart';
import 'package:habit_builder_demo/data/model/quote.dart';
import 'package:habit_builder_demo/data/repositories/habit_repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(HabitRepository habitRepository)
      : _habitRepository = habitRepository,
        super(HomeInitial()) {
    init();
  }

  final HabitRepository _habitRepository;

  final formKey = GlobalKey<FormState>();

  final Quote quote = const Quote(
      text: 'We first make our habits, and then our habits make us.',
      author: 'Anonymous');

  final List<Habit> _habits = [];
  List<Habit> get habits => _habits;

  String _pageTitle = 'Homepage';
  String get pageTitle => _pageTitle;

  Future<void> init() async {
    emit(HomeLoading());
    try {
      final List<Habit> loadedHabits = await _habitRepository.getHabits();
      _habits.clear();
      _habits.addAll(loadedHabits);
      emit(HomeHabitsLoaded(loadedHabits));
    } catch (error) {
      emit(HomeError(error.toString()));
    }
  }

  void onMenuPressed() => emit(const HomeMenuPressed('Menu pressed'));

  void onProfilePressed() => emit(const HomeProfilePressed('Profile pressed'));

  void onAddNewHabit() {
    _pageTitle = 'New Habit';
    formKey.currentState?.reset();
    emit(HomeAddNewHabitPressed());
  }

  void onCancelNewHabit() {
    _pageTitle = 'Homepage';
    emit(HomeCancelNewHabit());
  }

  void Function() onAppBarLeadingPressed(HomeState state) {
    if (state is HomeAddNewHabitPressed) {
      return onCancelNewHabit;
    }

    return onMenuPressed;
  }

  void onSaveHabit() {
    formKey.currentState?.validate();
  }

  void Function() onFabPressed(HomeState state) {
    if (state is HomeAddNewHabitPressed) {
      return onSaveHabit;
    }

    return onAddNewHabit;
  }
}
