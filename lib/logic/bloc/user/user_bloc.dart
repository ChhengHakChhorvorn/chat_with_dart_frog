import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dart_frog_web_socket/data/repository/user_repo.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../../data/data_export.dart';

part 'user_event.dart';

part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final userRepo = UserRepo();

  UserBloc() : super(UserInitial()) {
    on<RequestAllUserListEvent>(_getAllUser);
  }

  _getAllUser(RequestAllUserListEvent event, Emitter<UserState> emit) async {
    final result = await userRepo.getAllUser();

    // * Result Success
    result.whenSuccess((response) {
      if (response.status == 200) {
        emit(RequestAllUserSuccessState(response.data));
      } else {
        emit(UserErrorState(message: response.info));
      }
    });

    // ! Result Error
    result.whenError((error) {
      if (error is DioException) {
        emit(UserErrorState(message: "Server is not Responding"));
      } else {
        emit(UserErrorState(message: error.toString()));
      }
    });
  }
}
