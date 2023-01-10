import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../../config/api.dart';
import '../../utils/exception/exception.dart';
import '../../utils/utils.dart';
import '../models/user_model.dart';

class AuthenticationRepository {
  static final _sharedInstance = AuthenticationRepository();
  static AuthenticationRepository get sharedInstance => _sharedInstance;

  Map<String, dynamic> loginInfo = {};

  Future<void> load() async {
    try {
      final SharedPreferences pref = await SharedPreferences.getInstance();
      loginInfo =
          json.decode(pref.getString('login') ?? '{}') as Map<String, dynamic>;
    } catch (_) {}

    // pref.setString('authen_accessToken', accessToken ?? '');
    // pref.setString('authen_expiresIn', expiresIn ?? '');
    // pref.setString('authen_refreshExpiresIn', refreshExpiresIn ?? '');
    // pref.setString('authen_refreshToken', refreshToken ?? '');
    // pref.setString('authen_tokenType', tokenType ?? '');
    // pref.setString('authen_idToken', idToken ?? '');
    // pref.setString('authen_sessionState', sessionState ?? '');
    // pref.setString('authen_scope', scope ?? '');
    // pref.setString('authen_tokenApi', tokenApi ?? '');
  }

  Future<void> _save() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString('login', json.encode(loginInfo));
  }

  Future<void> login({
    required String username,
    required String password,
  }) async {
    return SfException.check(
      context: 'context',
      action: () async {
        if (Utils.isEmpty(username)) {
        } else if (password.isEmpty) {
        } else {
          final String usernameText = username.replaceAll(' ', '');
          final String passwordText = password.replaceAll(' ', '');
          final String deviceId = await Utils.deviceId();
          final Map<String, Object> body = {
            'userName': usernameText,
            'passWord': passwordText,
            'realms': 'EXTERNAL',
            'clientID': 'external_management',
            'appCode': 'external_management',
            'deviceCode': deviceId,
            'otpActionType': 0
          };

          final res = await getAuth()
              .post('savingapp/p/sysuser/pub/user-login', data: body);

          final Object data = res.refine(
            code: (d) => (d['Code'] as int) - 200,
            message: (d) => d['Message'] as String?,
            timestamp: (d) => null,
            data: (d) => d['Data'],
            context: 'context',
          );

          loginInfo = data as Map<String, dynamic>;
          _save();

          // final res = await api.methodPost(api: ApiConfig.login, body: body);
          // if (res['success']) {
          //   if (res['Data']['data'] != null) {
          //     return LoginModel.fromJson(res['Data']['data'], res['Data']);
          //   }
          // } else {
          //   final data = res['Data'];
          //   if (data is Map<String, dynamic> && data.containsKey('OtpStatus')) {
          //     return ErrorLoginModel.fromJson(data);
          //   } else if (data is int) {
          //     return ErrorLoginModel(otpStatus: data, failCount: 0);
          //   }
          // }
          // return errorHandle(res);
        }
      },
    );
  }

  Future<void> logout() async {
    loginInfo = {};
    _save();
  }
}
