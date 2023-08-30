import 'package:dart_frog_web_socket/helper/preferences.dart';
import 'package:dart_frog_web_socket/presentation/page_login.dart';
import 'package:dart_frog_web_socket/presentation/page_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'logic/bloc/chat/chat_bloc.dart';
import 'logic/bloc/counter/counter_bloc.dart';
import 'logic/bloc/user/user_bloc.dart';
import 'logic/logic_export.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppPreference.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CounterBloc(),
        ),
        BlocProvider(
          create: (context) => AuthBloc(),
        ),
        BlocProvider(
          create: (context) => UserBloc(),
        ),
        BlocProvider(
          create: (context) => ChatBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: AppPreference.getAccessToken() != null ? UserListPage() : LoginPage(),
      ),
    );
  }
}
