// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      json['status'] as int,
      json['info'] as String,
      json['accessToken'] as String,
      UserModel.fromJson(json['userInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'info': instance.info,
      'accessToken': instance.accessToken,
      'userInfo': instance.userInfo,
    };
