import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
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

  final Quote quote = const Quote(
      text: 'We first make our habits, and then our habits make us.',
      author: 'Anonymous');

  final List<Habit> _habits = [];
  List<Habit> get habits => _habits;

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
}
