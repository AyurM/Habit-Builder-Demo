import 'package:habit_builder_demo/data/model/sign_up_data.dart';
import 'package:habit_builder_demo/data/model/user_profile.dart';

abstract class IRestApi {
  Future<UserProfile?> googleAuth();

  Future<UserProfile?> facebookAuth();

  Future<UserProfile?> login(String email, String password);

  Future<UserProfile?> signUp(SignUpData signUpData);
}
