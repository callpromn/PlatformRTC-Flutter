import 'qrtc_flutter_ios_plugin_platform_interface.dart';
import 'package:flutter/services.dart';

class QrtcFlutterIosPlugin {
  Future<String?> getPlatformVersion() {
    return QrtcFlutterIosPluginPlatform.instance.getPlatformVersion();
  }

  static const MethodChannel _channel = MethodChannel('qrtc_flutter_ios_plugin');

  static Future<bool> createOrEnterRoom({
    required String serverUrl,
    required String sdkAppId,
    required String userSig,
    required String userId,
    required String userName,
    required String roomId,
    required String acceptLanguage,
  }) async {
    final bool success = await _channel.invokeMethod('createOrEnterRoom', {
      'serverUrl': serverUrl,
      'sdkAppId': sdkAppId,
      'userSig': userSig,
      'userId': userId,
      // 'userId': '${roomId}_$userId',
      'userName': userName,
      // 'roomId': '${sdkAppId}_$roomId',
      'roomId': roomId,
      'acceptLanguage': acceptLanguage,
    });
    return success;
  }
}
