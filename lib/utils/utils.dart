import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;
import 'package:flutter/services.dart';
import 'package:platform_device_id/platform_device_id.dart';

class Utils {
  static bool isEmpty(String? text) {
    return text == null ||
        text.trim().isEmpty ||
        text == 'null' ||
        text.isEmpty;
  }

  bool isNotEmpty(String? text) {
    return !isEmpty(text);
  }

  static Future<String> deviceId() async {
    late String deviceId;
    try {
      deviceId = await PlatformDeviceId.getDeviceId ?? 'Failed to get deviceId';
    } on PlatformException {
      deviceId = 'Failed to get deviceId.';
    }
    return deviceId;
  }

  static const bool isWeb = kIsWeb;
  static final bool isAndroid = defaultTargetPlatform == TargetPlatform.android;
  static final bool isIOS = defaultTargetPlatform == TargetPlatform.iOS;
}
