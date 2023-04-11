import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'qrtc_flutter_ios_plugin_method_channel.dart';

abstract class QrtcFlutterIosPluginPlatform extends PlatformInterface {
  /// Constructs a QrtcFlutterIosPluginPlatform.
  QrtcFlutterIosPluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static QrtcFlutterIosPluginPlatform _instance = MethodChannelQrtcFlutterIosPlugin();

  /// The default instance of [QrtcFlutterIosPluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelQrtcFlutterIosPlugin].
  static QrtcFlutterIosPluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [QrtcFlutterIosPluginPlatform] when
  /// they register themselves.
  static set instance(QrtcFlutterIosPluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
