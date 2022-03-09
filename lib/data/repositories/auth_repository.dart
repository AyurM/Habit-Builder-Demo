import 'package:habit_builder_demo/base/app_error.dart';
import 'package:habit_builder_demo/data/api/rest_api_interface.dart';
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
}
