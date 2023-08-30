part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class LoginSuccessState extends AuthState {
  final String accessToken;

  LoginSuccessState({required this.accessToken});
}

class AuthErrorState extends AuthState {
  final String message;

  AuthErrorState({this.message = ""});
}
