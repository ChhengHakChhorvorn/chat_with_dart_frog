part of 'chat_bloc.dart';

@immutable
abstract class ChatEvent {}

class ChatStartedEvent extends ChatEvent {
  final int senderId;
  final int receiverId;

  ChatStartedEvent({required this.senderId, required this.receiverId});
}

class SendMessageEvent extends ChatEvent {
  final ChatModel chat;

  SendMessageEvent({required this.chat});
}

class SaveMessageEvent extends ChatEvent {
  final List<ChatModel> chats;

  SaveMessageEvent({required this.chats});
}

class CloseConnectionEvent extends ChatEvent{
}
