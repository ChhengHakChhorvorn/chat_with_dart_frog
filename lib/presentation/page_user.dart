import 'package:dart_frog_web_socket/helper/preferences.dart';
import 'package:dart_frog_web_socket/presentation/page_chat.dart';
import 'package:dart_frog_web_socket/presentation/page_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/model/user/user_model.dart';
import '../logic/bloc/user/user_bloc.dart';

class UserListPage extends StatefulWidget {
  const UserListPage({super.key});

  @override
  State<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  List<UserModel> userList = [];
  final currentUser = AppPreference.getUserInfo();

  @override
  void initState() {
    super.initState();
    context.read<UserBloc>().add(RequestAllUserListEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        if (state is RequestAllUserSuccessState) {
          setState(() {
            userList = state.data;
          });
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('All Users'),
          actions: [
            IconButton(
                onPressed: () {
                  AppPreference.clearAll();
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => LoginPage()), (route) => false);
                },
                icon: Icon(Icons.exit_to_app))
          ],
        ),
        body: ListView.builder(
            itemCount: userList.length,
            itemBuilder: (context, index) {
              final user = userList[index];
              return _userItem(user);
            }),
      ),
    );
  }

  _userItem(UserModel user) {
    if (user.id == currentUser?.id) {
      return SizedBox.shrink();
    }
    return Card(
      child: ListTile(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => ChatPage(receiver: user)));
        },
        title: Text(user.name ?? ''),
        subtitle: Text(user.email ?? ''),
      ),
    );
  }
}
