import 'package:dart_frog_web_socket/data/response/global/global_response.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../model/user/user_model.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse extends GlobalResponse {
  @JsonKey(name: 'accessToken')
  final String accessToken;
  final UserModel userInfo;

  LoginResponse(super.status, super.info, this.accessToken, this.userInfo);

  factory LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}
