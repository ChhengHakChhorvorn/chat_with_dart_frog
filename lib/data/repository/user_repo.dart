import 'package:dart_frog_web_socket/data/api/api_service.dart';
import 'package:dart_frog_web_socket/data/response/user/user_response.dart';
import 'package:dart_frog_web_socket/helper/preferences.dart';
import 'package:multiple_result/multiple_result.dart';

class UserRepo {
  Future<Result<UserResponse, dynamic>> getAllUser() async {
    // * Call API
    try {
      final response = await ApiService().getAllUser(accessToken: AppPreference.getAccessToken()!);
      return Result.success(response);
    } catch (e) {
      return Result.error(e);
    }
  }
}
