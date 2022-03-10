import 'package:habit_builder_demo/data/api/rest_api_interface.dart';
import 'package:habit_builder_demo/data/model/sign_up_data.dart';
import 'package:habit_builder_demo/data/model/user_profile.dart';

const UserProfile _mockUser = UserProfile(
    id: 152,
    name: 'Mocked User',
    email: 'demo@test.com',
    imageUrl: 'https://randomuser.me/api/portraits/men/97.jpg');

class RestApi implements IRestApi {
  @override
  Future<UserProfile?> facebookAuth() =>
      Future.delayed(const Duration(milliseconds: 500), () => _mockUser);

  @override
  Future<UserProfile?> googleAuth() =>
      Future.delayed(const Duration(milliseconds: 500), () => _mockUser);

  @override
  Future<UserProfile?> login(String email, String password) =>
      Future.delayed(const Duration(milliseconds: 500), () => _mockUser);

  @override
  Future<UserProfile?> signUp(SignUpData signUpData) =>
      Future.delayed(const Duration(milliseconds: 500), () => _mockUser);
}
