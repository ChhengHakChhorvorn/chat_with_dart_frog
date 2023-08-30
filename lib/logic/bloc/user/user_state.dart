part of 'user_bloc.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {}

class RequestAllUserSuccessState extends UserState {
  final List<UserModel> data;

  RequestAllUserSuccessState(this.data);
}

class UserErrorState extends UserState {
  final String message;

  UserErrorState({this.message = ""});
}
