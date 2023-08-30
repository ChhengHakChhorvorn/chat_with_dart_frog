import 'package:dart_frog_web_socket/data/data_export.dart';
import 'package:dart_frog_web_socket/data/model/chat/chat_model.dart';
import 'package:dart_frog_web_socket/helper/preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jiffy/jiffy.dart';

import '../logic/bloc/chat/chat_bloc.dart';

class ChatPage extends StatefulWidget {
  final UserModel receiver;

  const ChatPage({super.key, required this.receiver});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final currentUser = AppPreference.getUserInfo()!;
  final txtMessage = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<ChatBloc>().add(ChatStartedEvent(senderId: currentUser.id!, receiverId: widget.receiver.id!));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.receiver.name ?? ''),
        leading: BackButton(
          onPressed: () {
            context.read<ChatBloc>().add(CloseConnectionEvent());
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<ChatBloc, ChatState>(
              builder: (context, state) {
                if (state is ChattingState) {
                  final chats = state.chats.reversed.toList();

                  return ListView.builder(
                    reverse: true,
                    itemCount: chats.length,
                    itemBuilder: (context, index) {
                      final chat = chats[index];
                      return _chatBox(chat);
                    },
                  );
                }
                return Container();
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            color: Colors.deepPurple.shade200,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
                    clipBehavior: Clip.hardEdge,
                    child: TextField(
                      controller: txtMessage,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        fillColor: Colors.white,
                        filled: true,
                      ),
                    ),
                  ),
                ),
                IconButton(
                    onPressed: _onSend,
                    icon: const Icon(
                      Icons.send_rounded,
                      color: Colors.white,
                      size: 30,
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }

  _chatBox(ChatModel chat) {
    return Align(
      alignment: currentUser.id == chat.senderId ? Alignment.bottomRight : Alignment.bottomLeft,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment:
              currentUser.id == chat.senderId ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Text(
              chat.senderName,
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.deepPurple.shade50,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Text(chat.message),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(Jiffy.parse(chat.dateTime).format(pattern: "HH:mm").toString()),
          ],
        ),
      ),
    );
  }

  _onSend() {
    if (txtMessage.text.isEmpty) return;
    final chat = ChatModel(
        senderId: currentUser.id!,
        senderName: currentUser.name!,
        senderEmail: currentUser.email!,
        receiverId: widget.receiver.id!,
        receiverName: widget.receiver.name!,
        receiverEmail: widget.receiver.email!,
        message: txtMessage.text,
        dateTime: DateTime.now().toString());
    context.read<ChatBloc>().add(SendMessageEvent(chat: chat));
    txtMessage.clear();
    setState(() {});
  }
}
