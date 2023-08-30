import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/http.dart';

import '../../helper/helper_export.dart';
import '../data_export.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: apiUrl)
abstract class ApiService {
  factory ApiService({String? baseUrl}) {
    final dio = Dio();
    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
      responseBody: true,
      maxWidth: 111,
    ));
    dio.options = BaseOptions(
      headers: {
        "Accept": "*/*",
      },
    );
    return _ApiService(dio, baseUrl: baseUrl);
  }

// * API ENDPOINTS HERE

  // * Auth
  @POST("auth/login")
  Future<LoginResponse> login({
    @Body() required AuthRequest request,
  });

  // * User

  @GET("user/list")
  Future<UserResponse> getAllUser({
    @Header('Authorization') required String accessToken,
  });
}
