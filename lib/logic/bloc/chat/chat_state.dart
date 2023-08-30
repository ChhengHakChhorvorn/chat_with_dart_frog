part of 'chat_bloc.dart';

@immutable
abstract class ChatState {}

class ChatInitial extends ChatState {}

class ChattingState extends ChatState {
  final List<ChatModel> chats;

  ChattingState({required this.chats});
}
