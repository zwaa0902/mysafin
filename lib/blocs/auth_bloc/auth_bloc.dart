import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../data/models/user_model.dart';
import '../../data/repository/authentication_repository.dart';
import '../../utils/exception/exception.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(super.initialState) : super() {
    on<AuthEvent>((event, emit) async {
      if (event is LoginEvent) {
        emit(AuthLoadingState());

        try {
          await AuthenticationRepository.sharedInstance.login(
            username: event.username,
            password: event.password,
          );
          await AuthenticationRepository.sharedInstance.load();
          if (AuthenticationRepository.sharedInstance.loginInfo['user'] !=
              null) {
            final res = UserModel.fromJson(AuthenticationRepository
                .sharedInstance.loginInfo['user'] as Map<String, dynamic>);
            emit(AuthSuccessState(userModel: res));
          }
        } on SfHttpException catch (ex) {
          emit(AuthErrorState(message: ex.message ?? 'Login error'));

          if (ex.code == 404) {
            debugPrint('Invalid username or password.');
          }
        }
      } else if (event is LogoutEvent) {
        await AuthenticationRepository.sharedInstance.logout();
        emit(const AuthSuccessState(userModel: null));
      }
    });
  }
}
