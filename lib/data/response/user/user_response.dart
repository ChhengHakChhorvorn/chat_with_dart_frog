import 'package:dart_frog_web_socket/data/response/global/global_response.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../model/user/user_model.dart';

part 'user_response.g.dart';

@JsonSerializable()
class UserResponse extends GlobalResponse {
  @JsonKey(name: 'data')
  final List<UserModel> data;

  UserResponse(super.status, super.info, this.data);

  factory UserResponse.fromJson(Map<String, dynamic> json) => _$UserResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$UserResponseToJson(this);
}
