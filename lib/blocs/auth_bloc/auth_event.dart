part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class StartEvent extends AuthEvent {}

class LoginEvent extends AuthEvent {
  const LoginEvent({
    required this.username,
    required this.password,
  });

  final String username;
  final String password;
}

class LogoutEvent extends AuthEvent {}
