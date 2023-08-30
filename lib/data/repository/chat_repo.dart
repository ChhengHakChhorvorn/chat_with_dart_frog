import 'dart:convert';

import 'package:dart_frog_web_socket/data/model/chat/chat_model.dart';
import 'package:web_socket_client/web_socket_client.dart';

/// A Dart package which manages the counter domain.
class ChatRepo {
  ChatRepo({WebSocket? socket, required int senderId, required int receiverId})
      : _ws = socket ??
            WebSocket(
                Uri.parse('ws://192.168.103.33:8080/chat?senderId=${senderId}&receiverId=${receiverId}'));

  final WebSocket _ws;

  /// Send an increment message to the server.
  void sendMessage(ChatModel chat) => _ws.send(jsonEncode(chat));

  Stream<dynamic> get getMessage => _ws.messages;

  /// Close the connection.
  void close() => _ws.close();
}
