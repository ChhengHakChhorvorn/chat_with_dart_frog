// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'global_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GlobalResponse _$GlobalResponseFromJson(Map<String, dynamic> json) =>
    GlobalResponse(
      json['status'] as int,
      json['info'] as String,
    );

Map<String, dynamic> _$GlobalResponseToJson(GlobalResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'info': instance.info,
    };
