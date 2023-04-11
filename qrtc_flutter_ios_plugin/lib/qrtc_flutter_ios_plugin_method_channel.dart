import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'qrtc_flutter_ios_plugin_platform_interface.dart';

/// An implementation of [QrtcFlutterIosPluginPlatform] that uses method channels.
class MethodChannelQrtcFlutterIosPlugin extends QrtcFlutterIosPluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('qrtc_flutter_ios_plugin');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
