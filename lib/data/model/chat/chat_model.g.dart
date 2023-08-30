// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatModel _$ChatModelFromJson(Map<String, dynamic> json) => ChatModel(
      senderId: json['senderId'] as int,
      senderName: json['senderName'] as String,
      senderEmail: json['senderEmail'] as String,
      receiverId: json['receiverId'] as int,
      receiverName: json['receiverName'] as String,
      receiverEmail: json['receiverEmail'] as String,
      message: json['message'] as String,
      dateTime: json['dateTime'] as String,
    );

Map<String, dynamic> _$ChatModelToJson(ChatModel instance) => <String, dynamic>{
      'senderId': instance.senderId,
      'senderName': instance.senderName,
      'senderEmail': instance.senderEmail,
      'receiverId': instance.receiverId,
      'receiverName': instance.receiverName,
      'receiverEmail': instance.receiverEmail,
      'message': instance.message,
      'dateTime': instance.dateTime,
    };
