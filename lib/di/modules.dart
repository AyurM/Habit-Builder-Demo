import 'package:get_it/get_it.dart';
import 'package:habit_builder_demo/data/api/rest_api.dart';
import 'package:habit_builder_demo/data/api/rest_api_interface.dart';
import 'package:habit_builder_demo/data/repositories/auth_repository.dart';
import 'package:habit_builder_demo/screens/login/login_cubit.dart';
import 'package:habit_builder_demo/screens/onboarding/onboarding_cubit.dart';

final GetIt getIt = GetIt.instance;

void setup() {
  registerHttpClient();
  registerRepositories();
  registerCubits();
}

void registerHttpClient() => getIt.registerSingleton<IRestApi>(RestApi());

void registerRepositories() {
  getIt.registerLazySingleton(() => AuthRepository(get()));
}

void registerCubits() {
  getIt.registerFactory(() => OnboardingCubit());
  getIt.registerFactory(() => LoginCubit(get()));
}

T get<T extends Object>() => getIt.get<T>();
