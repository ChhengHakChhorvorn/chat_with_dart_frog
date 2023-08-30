part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class RequestLoginEvent extends AuthEvent {
  final AuthRequest request;

  RequestLoginEvent({required this.request});
}
