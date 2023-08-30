import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dart_frog_web_socket/data/data_export.dart';
import 'package:dart_frog_web_socket/data/repository/auth_repo.dart';
import 'package:dart_frog_web_socket/helper/preferences.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final authRepo = AuthRepo();

  AuthBloc() : super(AuthInitial()) {
    on<RequestLoginEvent>(_login);
  }

  _login(RequestLoginEvent event, Emitter<AuthState> emit) async {
    final result = await authRepo.login(request: event.request);

    // * Result Success
    await result.whenSuccess((response) async {
      if (response.status == 200) {
        await AppPreference.saveAccessToken(response.accessToken);
        await AppPreference.saveUserInfo(jsonEncode(response.userInfo));
        emit(LoginSuccessState(accessToken: response.accessToken));
      } else {
        emit(AuthErrorState(message: response.info));
      }
    });

    // ! Result Error
    result.whenError((error) {
      if (error is DioException) {
        emit(AuthErrorState(message: "Server is not Responding"));
      } else {
        emit(AuthErrorState(message: error.toString()));
      }
    });
  }
}
