import 'package:flutter/material.dart';
import 'package:qrtc_flutter_ios_plugin/qrtc_flutter_ios_plugin.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isConnecting = false;
  bool _isEnteredToRoom = false;

  void _connectToRoom() async {
    setState(() {
      _isConnecting = true;
      _isEnteredToRoom = false;
    });

    final success = await QrtcFlutterIosPlugin.createOrEnterRoom(
      serverUrl: "rtc.callpro.mn/websocket",
      sdkAppId: "vLFiFqMbXXk1GCqJVtySqn",
      userSig: "",
      userId: "test01_1111",
      userName: "iOSTest02",
      roomId: "vLFiFqMbXXk1GCqJVtySqn_test01",
      acceptLanguage: "zh-CN",
    );

    setState(() {
      _isConnecting = false;
      _isEnteredToRoom = true;

      if (!success) {
        debugPrint('Failed to enter the room');
        _isEnteredToRoom = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('QRTC Flutter iOS Plugin Example'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: _connectToRoom,
            child: Text(_isConnecting
                ? 'Connecting...'
                : _isEnteredToRoom
                    ? 'Leave Room'
                    : 'Enter Room'),
          ),
        ),
      ),
    );
  }
}
