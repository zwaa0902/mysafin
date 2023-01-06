import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../../utils/utils.dart';

class AuthenticationRepository {
  Map<String, dynamic> loginINfo = {};

  Future<void> load() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    loginINfo =
        json.decode(pref.getString('login') ?? '{}') as Map<String, dynamic>;
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
    await pref.setString('login', loginINfo.toString());
  }

  Future<void> login({
    required String username,
    required String password,
  }) async {
    if (Utils.isEmpty(username)) {
    } else if (password.isEmpty) {
    } else {
      String phone = username.replaceAll(' ', '');
      String deviceId = await Utils.deviceId();
      final body = {
        'userName': phone,
        'passWord': password,
        'realms': 'EXTERNAL',
        'clientID': 'external_management',
        'appCode': 'external_management',
        'deviceCode': deviceId,
        'otpActionType': 0
      };

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

    Future<void> logout() async {}
  }
}
