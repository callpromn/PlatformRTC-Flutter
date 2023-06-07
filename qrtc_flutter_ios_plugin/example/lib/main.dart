import 'package:flutter/material.dart';
import 'package:qrtc_flutter_ios_plugin/qrtc_flutter_ios_plugin.dart';
import 'package:permission_handler/permission_handler.dart';

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

  PermissionStatus _cameraPermissionStatus = PermissionStatus.denied;
  PermissionStatus _microphonePermissionStatus = PermissionStatus.denied;

  Future<void> _checkPermissions() async {
    final cameraStatus = await Permission.camera.status;
    final microphoneStatus = await Permission.microphone.status;

    setState(() {
      _cameraPermissionStatus = cameraStatus;
      _microphonePermissionStatus = microphoneStatus;
    });
  }

  Future<void> _requestPermissions() async {
    final cameraStatus = await Permission.camera.request();
    final microphoneStatus = await Permission.microphone.request();

    setState(() {
      _cameraPermissionStatus = cameraStatus;
      _microphonePermissionStatus = microphoneStatus;
    });
  }

  @override
  void initState() {
    super.initState();
    _checkPermissions();
  }

  void _connectToRoom() async {
    await _requestPermissions();

    if (!_cameraPermissionStatus.isGranted || !_microphonePermissionStatus.isGranted) {
      return;
    }

    setState(() {
      _isConnecting = true;
      _isEnteredToRoom = false;
    });

    final success = await QrtcFlutterIosPlugin.createOrEnterRoom(
      serverUrl: "wss://rtc.callpro.mn/websocket",
      sdkAppId: "vLFiFqMbXXk1GCqJVtySqn",
      userSig: "",
      userId: "111122223333_1111",
      userName: "iOSTest1",
      roomId: "vLFiFqMbXXk1GCqJVtySqn_111122223333",
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
