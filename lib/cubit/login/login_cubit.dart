import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../data/models/user_model.dart';
import '../../data/repository/authentication_repository.dart';
import '../../utils/exception/exception.dart';

part 'login_state.dart';

class LoginCubit extends HydratedCubit<LoginState> {
  LoginCubit() : super(const LoginState(userModel: null));

  Future<void> onLogin() async {
    final authRepo = AuthenticationRepository.sharedInstance;
    try {
      await authRepo.login(
        username: 'username',
        password: 'password',
      );
      await authRepo.load();
      if (authRepo.loginInfo['user'] != null) {
        final res = UserModel.fromJson(
            authRepo.loginInfo['user'] as Map<String, dynamic>);
        updateUserInfo(LoginState(userModel: res));
      }
    } on SfHttpException catch (ex) {
      if (ex.code == 404) {
        print('Invalid username or password.');
      }
    }
  }

  void updateUserInfo(LoginState state) {
    emit(state);
  }

  @override
  LoginState? fromJson(Map<String, dynamic> json) {
    return null;
  }

  @override
  Map<String, dynamic>? toJson(LoginState state) {
    return null;
  }
}
