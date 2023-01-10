part of 'login_cubit.dart';

class LoginState extends Equatable {
  const LoginState({required this.userModel});

  final UserModel? userModel;

  @override
  List<Object?> get props => [userModel];
}
