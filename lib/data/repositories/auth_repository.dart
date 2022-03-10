import 'package:habit_builder_demo/base/app_error.dart';
import 'package:habit_builder_demo/data/api/rest_api_interface.dart';
import 'package:habit_builder_demo/data/model/sign_up_data.dart';
import 'package:habit_builder_demo/data/model/user_profile.dart';

class AuthRepository {
  final IRestApi _restApi;

  AuthRepository(IRestApi restApi) : _restApi = restApi;

  Future<UserProfile> signInWithGoogle() async {
    final UserProfile? userProfile = await _restApi.googleAuth();
    if (userProfile == null) {
      throw const AppException(AppErrorType.unauthorized);
    }

    return userProfile;
  }

  Future<UserProfile> signInWithFacebook() async {
    final UserProfile? userProfile = await _restApi.facebookAuth();
    if (userProfile == null) {
      throw const AppException(AppErrorType.unauthorized);
    }

    return userProfile;
  }

  Future<UserProfile> loginWithEmailAndPassword(
      String email, String password) async {
    final UserProfile? userProfile = await _restApi.login(email, password);
    if (userProfile == null) {
      throw const AppException(AppErrorType.unauthorized);
    }

    return userProfile;
  }

  Future<UserProfile> createAccount(SignUpData signUpData) async {
    final UserProfile? userProfile = await _restApi.signUp(signUpData);
    if (userProfile == null) {
      throw const AppException(AppErrorType.unauthorized);
    }

    return userProfile;
  }

  Future<bool> sendResetLink(String email) async {
    final bool? result = await _restApi.sendResetPasswordLink(email);
    if (result == null) {
      throw const AppException(AppErrorType.unauthorized);
    }

    return result;
  }
}
