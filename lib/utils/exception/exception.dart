import 'dart:io';

import 'package:dio/dio.dart';
import 'package:logging/logging.dart';

import '../logging.dart';

class SfException implements Exception {
  const SfException({required this.code, this.message});
  // Exception
  @override
  String toString() {
    return "SfException: { code: '$code', message: '$message', super: '${super.toString()}'}";
  }

  // SfException
  static const int codeUnknownError = -1;
  static const int codePhysicalError = 1;
  static const int codeHttpError = 2;
  static const int codeLogicError = 3;

  final int code;

  final String? message;

  static Future<T> check<T>({
    required String context,
    required Future<T> Function() action,
  }) async {
    try {
      return await action();
    } on DioError catch (ex) {
      ex.toSfException().emit(context: context);
    } on SfException {
      rethrow;
    } catch (ex) {
      SfException(
        code: SfException.codeUnknownError,
        message: ex.toString(),
      ).emit(context: context);
    }

    throw UnimplementedError('NOTREACHED');
  }
}

class SfPhysicalException extends SfException {
  // SfPhysicalException
  const SfPhysicalException({super.message, required this.cause})
      : super(code: SfException.codePhysicalError);
  factory SfPhysicalException.fromCause(DioError cause) {
    return SfPhysicalException(cause: cause);
  }
  // SfException
  @override
  String toString() {
    return "SfPhysicalException: { cause: '$cause', super: '${super.toString()}'}";
  }

  final DioError cause;
}

class SfHttpException extends SfException {
  // SfHttpException
  const SfHttpException({super.message, required this.statusCode})
      : super(code: SfException.codePhysicalError);
  // SfException
  @override
  String toString() {
    return "SfHttpException: { statusCode: '$statusCode', super: '${super.toString()}'}";
  }

  final int statusCode;
}

class SfLogicException extends SfException {
  // SfLogicException
  const SfLogicException({
    super.message,
    required this.logicCode,
    this.logicTimestamp,
    this.logicMessage,
  }) : super(code: SfException.codePhysicalError);
  // SfException
  @override
  String toString() {
    return "SfLogicException: { logicCode: '$logicCode', logicMessage: '$logicMessage', logicTimestamp: '$logicTimestamp', super: '${super.toString()}'}";
  }

  final int logicCode;

  final String? logicMessage;

  final DateTime? logicTimestamp;
}

extension SfExceptionUtils on SfException {
  void emit({Level level = Level.SEVERE, required String context}) {
    logging.log(level, '$context failure: ${toString()}.');
    throw this;
  }
}

extension on DioError {
  SfException toSfException() {
    final DioErrorType type = this.type;
    // ignore: always_specify_types
    final error = this.error;
    if (type == DioErrorType.other && error is SocketException) {
      return SfPhysicalException(
          cause: this,
          message: "Call Api failure: Connection error: '$error'.");
    }

    if (type == DioErrorType.response) {
      final int? responseStatusCode = response?.statusCode;
      if (responseStatusCode == null) {
        return const SfException(
          code: SfException.codeUnknownError,
          message: 'Response status code is null.',
        );
      }

      return SfHttpException(statusCode: responseStatusCode);
    }

    return SfException(
      code: SfException.codeUnknownError,
      message: "Unknown error: '$this'.",
    );
  }
}

extension SfLogicExceptionResponse<T> on Response<T> {
  void check({
    required String context,
    required int? Function(T) code,
    required String? Function(T) message,
    required DateTime? Function(T) timestamp,
  }) {
    // ignore: always_specify_types
    final data = this.data;
    if (data == null) {
      SfException(
        code: SfException.codeUnknownError,
        message: "Unknown error: '$this'.",
      ).emit(context: context);

      throw UnimplementedError('NOTREACHED');
    }

    final int? codeValue = code(data);

    if (codeValue == null) {
      SfException(
        code: SfException.codeUnknownError,
        message: "Unknown error: '$this'.",
      ).emit(context: context);
    }

    if (codeValue != 0) {
      SfLogicException(
        logicCode: codeValue!,
        logicMessage: message(data),
        logicTimestamp: timestamp(data),
      ).emit(context: context);
    }
  }

  D refine<D>({
    required int? Function(T) code,
    required String? Function(T) message,
    required DateTime? Function(T) timestamp,
    required D? Function(T) data,
    required String context,
  }) {
    check(code: code, message: message, timestamp: timestamp, context: context);

    // ignore: always_specify_types
    final dataData = data(this.data as T);

    if (dataData == null) {
      SfException(
        code: SfException.codeUnknownError,
        message: "Unknown error: '$this'.",
      ).emit(context: context);
    }

    return dataData as D;
  }
}
