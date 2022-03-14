import 'package:habit_builder_demo/base/app_error.dart';
import 'package:habit_builder_demo/data/api/rest_api_interface.dart';
import 'package:habit_builder_demo/data/model/habit.dart';

class HabitRepository {
  final IRestApi _restApi;

  HabitRepository(IRestApi restApi) : _restApi = restApi;

  Future<List<Habit>> getHabits({DateTime? date}) async {
    final List<Habit>? habits =
        await _restApi.getHabitList(date ?? DateTime.now());
    if (habits == null) {
      throw const AppException(AppErrorType.noData);
    }

    return habits;
  }
}
