part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitState extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthSuccessState extends AuthState {
  const AuthSuccessState({required this.userModel});

  final UserModel? userModel;
}

class AuthUpdateState extends AuthState {
  const AuthUpdateState({required this.userModel});

  final UserModel? userModel;
}

class AuthErrorState extends AuthState {
  const AuthErrorState({required this.message});

  final String message;
}
