import 'package:dart_frog_web_socket/data/data_export.dart';
import 'package:multiple_result/multiple_result.dart';

class AuthRepo {
  Future<Result<LoginResponse, dynamic>> login({
    required AuthRequest request,
  }) async {
    // * Call API
    try {
      final response = await ApiService().login(request: request);
      return Result.success(response);
    } catch (e) {
      return Result.error(e);
    }
  }
}
