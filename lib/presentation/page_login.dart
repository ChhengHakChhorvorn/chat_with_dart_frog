import 'package:dart_frog_web_socket/data/data_export.dart';
import 'package:dart_frog_web_socket/presentation/page_counter.dart';
import 'package:dart_frog_web_socket/presentation/page_user.dart';
import 'package:dart_frog_web_socket/presentation/widget/custom_button.dart';
import 'package:dart_frog_web_socket/presentation/widget/custom_textField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/logic_export.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final txtUsername = TextEditingController();
  final txtPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => UserListPage(),
            ),
          );
        }
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.message,
                color: Colors.deepPurple.shade500,
                size: 120,
              ),
              SizedBox(height: 20),
              CustomTextField(
                hintText: "Username",
                controller: txtUsername,
              ),
              SizedBox(height: 20),
              CustomTextField(
                hintText: "Password",
                controller: txtPassword,
              ),
              SizedBox(height: 20),
              CustomButton(
                label: 'Login',
                onPressed: () {
                  if (txtUsername.text.isNotEmpty && txtPassword.text.isNotEmpty) {
                    context.read<AuthBloc>().add(
                          RequestLoginEvent(
                            request: AuthRequest(
                              email: txtUsername.text,
                              password: txtPassword.text,
                            ),
                          ),
                        );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
