import 'package:get_it/get_it.dart';
import 'package:habit_builder_demo/data/api/rest_api.dart';
import 'package:habit_builder_demo/data/api/rest_api_interface.dart';
import 'package:habit_builder_demo/data/repositories/auth_repository.dart';
import 'package:habit_builder_demo/data/repositories/habit_repository.dart';
import 'package:habit_builder_demo/res/views/sign_up_form/sign_up_form_cubit.dart';
import 'package:habit_builder_demo/screens/home/home_cubit.dart';
import 'package:habit_builder_demo/screens/login/login_cubit.dart';
import 'package:habit_builder_demo/screens/new_habit/new_habit_cubit.dart';
import 'package:habit_builder_demo/screens/onboarding/onboarding_cubit.dart';
import 'package:habit_builder_demo/screens/reset_password/reset_password_cubit.dart';
import 'package:habit_builder_demo/screens/sign_up/sign_up_cubit.dart';

final GetIt getIt = GetIt.instance;

void setup() {
  registerHttpClient();
  registerRepositories();
  registerCubits();
}

void registerHttpClient() => getIt.registerSingleton<IRestApi>(MockRestApi());

void registerRepositories() {
  getIt.registerLazySingleton(() => AuthRepository(get()));
  getIt.registerLazySingleton(() => HabitRepository(get()));
}

void registerCubits() {
  getIt.registerFactory(() => OnboardingCubit());
  getIt.registerFactory(() => LoginCubit(get()));
  getIt.registerFactory(() => SignUpCubit(get()));
  getIt.registerFactory(() => SignUpFormCubit());
  getIt.registerFactory(() => ResetPasswordCubit(get()));
  getIt.registerFactory(() => HomeCubit(get()));
  getIt.registerFactory(() => NewHabitCubit());
}

T get<T extends Object>() => getIt.get<T>();
