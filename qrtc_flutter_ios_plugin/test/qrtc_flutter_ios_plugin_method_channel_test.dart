import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:qrtc_flutter_ios_plugin/qrtc_flutter_ios_plugin_method_channel.dart';

void main() {
  MethodChannelQrtcFlutterIosPlugin platform = MethodChannelQrtcFlutterIosPlugin();
  const MethodChannel channel = MethodChannel('qrtc_flutter_ios_plugin');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
