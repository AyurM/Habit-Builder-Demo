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
  final TextEditingController habitNameController = TextEditingController();

  final Quote quote = const Quote(
      text: 'We first make our habits, and then our habits make us.',
      author: 'Anonymous');

  final List<Habit> _habits = [];
  List<Habit> get habits => _habits;

  String get pageTitle => state.title;

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

  void onMenuPressed() => emit(HomeMenuPressed());

  void onProfilePressed() => emit(HomeProfilePressed());

  void onAddNewHabit() {
    formKey.currentState?.reset();
    habitNameController.clear();
    emit(const HomeAddNewHabitPressed());
  }

  void onCancelNewHabit() => emit(HomeCancelNewHabit());

  void Function() onAppBarLeadingPressed(HomeState state) {
    if (state is HomeAddNewHabitPressed) {
      return onCancelNewHabit;
    }

    return onMenuPressed;
  }

  void onSaveHabit() {
    final bool? isFormValid = formKey.currentState?.validate();
    if (isFormValid ?? false) {
      final String newHabitName = habitNameController.text;
      emit(HomeNewHabitAdded(newHabitName));
    }
  }

  void Function() onFabPressed(HomeState state) {
    if (state is HomeAddNewHabitPressed) {
      return onSaveHabit;
    }

    return onAddNewHabit;
  }

  Future<bool> onBackPressed() async {
    if (state is HomeAddNewHabitPressed) {
      onCancelNewHabit();
      return false;
    }
    return true;
  }
}
