import 'package:json_annotation/json_annotation.dart';

part 'chat_model.g.dart';

@JsonSerializable()
class ChatModel {
  final int senderId;
  final String senderName;
  final String senderEmail;
  final int receiverId;
  final String receiverName;
  final String receiverEmail;
  final String message;
  final String dateTime;

  ChatModel({
    required this.senderId,
    required this.senderName,
    required this.senderEmail,
    required this.receiverId,
    required this.receiverName,
    required this.receiverEmail,
    required this.message,
    required this.dateTime,
  });

  factory ChatModel.fromJson(Map<String, dynamic> json) => _$ChatModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChatModelToJson(this);
}
