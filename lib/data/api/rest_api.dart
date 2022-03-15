import 'package:habit_builder_demo/data/api/rest_api_interface.dart';
import 'package:habit_builder_demo/data/model/habit.dart';
import 'package:habit_builder_demo/data/model/sign_up_data.dart';
import 'package:habit_builder_demo/data/model/user_profile.dart';

const UserProfile _mockUser = UserProfile(
    id: 152,
    name: 'Mocked User',
    email: 'demo@test.com',
    imageUrl: 'https://randomuser.me/api/portraits/men/97.jpg');

const List<Habit> _mockHabits = [
  Habit(name: 'Read A Book', values: [
    HabitFrequency.often,
    HabitFrequency.often,
    HabitFrequency.seldom,
    HabitFrequency.often,
    HabitFrequency.none,
    HabitFrequency.often,
    HabitFrequency.seldom
  ]),
  Habit(name: 'Exercise', values: [
    HabitFrequency.seldom,
    HabitFrequency.often,
    HabitFrequency.seldom,
    HabitFrequency.often,
    HabitFrequency.often,
    HabitFrequency.none,
    HabitFrequency.often
  ]),
  Habit(name: 'Wake Up Early', values: [
    HabitFrequency.often,
    HabitFrequency.often,
    HabitFrequency.none,
    HabitFrequency.seldom,
    HabitFrequency.often,
    HabitFrequency.seldom,
    HabitFrequency.often
  ]),
  Habit(name: 'Walk Dog', values: [
    HabitFrequency.often,
    HabitFrequency.seldom,
    HabitFrequency.often,
    HabitFrequency.seldom,
    HabitFrequency.often,
    HabitFrequency.seldom,
    HabitFrequency.often
  ])
];

const Duration _mockLoadingDuration = Duration(milliseconds: 750);

class MockRestApi implements IRestApi {
  @override
  Future<UserProfile?> facebookAuth() =>
      Future.delayed(_mockLoadingDuration, () => _mockUser);

  @override
  Future<UserProfile?> googleAuth() =>
      Future.delayed(_mockLoadingDuration, () => _mockUser);

  @override
  Future<UserProfile?> login(String email, String password) =>
      Future.delayed(_mockLoadingDuration, () => _mockUser);

  @override
  Future<UserProfile?> signUp(SignUpData signUpData) =>
      Future.delayed(_mockLoadingDuration, () => _mockUser);

  @override
  Future<bool?> sendResetPasswordLink(String email) =>
      Future.delayed(_mockLoadingDuration, () => true);

  @override
  Future<List<Habit>?> getHabitList(DateTime date) =>
      Future.delayed(_mockLoadingDuration, () => _mockHabits);
}
