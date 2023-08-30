import 'package:json_annotation/json_annotation.dart';

part 'global_response.g.dart';

@JsonSerializable()
class GlobalResponse {
  @JsonKey(name: 'status')
  final int status;

  @JsonKey(name: 'info')
  final String info;

  GlobalResponse(this.status, this.info);

  factory GlobalResponse.fromJson(Map<String, dynamic> json) => _$GlobalResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GlobalResponseToJson(this);
}
