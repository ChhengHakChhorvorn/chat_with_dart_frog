import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/model/chat/chat_model.dart';
import '../../../data/repository/chat_repo.dart';

part 'chat_event.dart';

part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  late ChatRepo chatRepo;

  ChatBloc() : super(ChatInitial()) {
    on<ChatStartedEvent>(_startChat);
    on<SendMessageEvent>(_sendMessage);
    on<SaveMessageEvent>(_saveMessage);
    on<CloseConnectionEvent>(_close);
  }

  _startChat(ChatStartedEvent event, Emitter<ChatState> emit) {
    chatRepo = ChatRepo(senderId: event.senderId, receiverId: event.receiverId);
    print("Chat Started");
    chatRepo.getMessage.listen((data) {
      if (data is String) {
        print("LISTENING ON :::::: ${data}");
        List<dynamic> message = jsonDecode(data);
        List<ChatModel> chats = message.map((e) => ChatModel.fromJson(e)).toList();
        // print(chats[0].message);

        add(SaveMessageEvent(chats: chats));
      }
    });
  }

  _sendMessage(SendMessageEvent event, Emitter<ChatState> emit) {
    chatRepo.sendMessage(event.chat);
  }

  _saveMessage(SaveMessageEvent event, Emitter<ChatState> emit) {
    emit(ChattingState(chats: event.chats));
  }

  _close(CloseConnectionEvent event, Emitter<ChatState> emit) {
    chatRepo.close();
  }
}
