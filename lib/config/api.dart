import 'package:dio/dio.dart';
import 'package:nd_dio_utils/nd_dio_utils.dart';
import 'config.dart';

Dio? _loginDio;

Dio getAuth() {
  if (_loginDio == null) {
    _loginDio = Dio(BaseOptions(baseUrl: baseUrl));
    enablePrettyLogger([_loginDio!]);
    enableCurlLogger([_loginDio!]);
  }
  return _loginDio!;
}
