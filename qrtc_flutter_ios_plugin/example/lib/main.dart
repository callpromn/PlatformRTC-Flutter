import 'package:flutter/material.dart';
import 'package:qrtc_flutter_ios_plugin/qrtc_flutter_ios_plugin.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('QRTC Flutter iOS Plugin Example'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () async {
              final success = await QrtcFlutterIosPlugin.createOrEnterRoom(
                serverUrl: "rtc.callpro.mn/websocket",
                sdkAppId: "vLFiFqMbXXk1GCqJVtySqn",
                userSig: "",
                userId: "test_iostest1",
                userName: "iOS Test 1",
                roomId: "test",
                acceptLanguage: "zh-CN",
              );
              if (success) {
                print('Successfully entered the room');
              } else {
                print('Failed to enter the room');
              }
            },
            child: Text('Enter Room'),
          ),
        ),
      ),
    );
  }
}
