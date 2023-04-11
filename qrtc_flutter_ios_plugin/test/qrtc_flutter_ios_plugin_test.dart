import 'package:flutter_test/flutter_test.dart';
import 'package:qrtc_flutter_ios_plugin/qrtc_flutter_ios_plugin.dart';
import 'package:qrtc_flutter_ios_plugin/qrtc_flutter_ios_plugin_platform_interface.dart';
import 'package:qrtc_flutter_ios_plugin/qrtc_flutter_ios_plugin_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockQrtcFlutterIosPluginPlatform
    with MockPlatformInterfaceMixin
    implements QrtcFlutterIosPluginPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final QrtcFlutterIosPluginPlatform initialPlatform = QrtcFlutterIosPluginPlatform.instance;

  test('$MethodChannelQrtcFlutterIosPlugin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelQrtcFlutterIosPlugin>());
  });

  test('getPlatformVersion', () async {
    QrtcFlutterIosPlugin qrtcFlutterIosPlugin = QrtcFlutterIosPlugin();
    MockQrtcFlutterIosPluginPlatform fakePlatform = MockQrtcFlutterIosPluginPlatform();
    QrtcFlutterIosPluginPlatform.instance = fakePlatform;

    expect(await qrtcFlutterIosPlugin.getPlatformVersion(), '42');
  });
}
