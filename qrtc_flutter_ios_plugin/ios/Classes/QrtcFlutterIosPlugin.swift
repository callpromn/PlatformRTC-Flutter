import Flutter
import UIKit

import QRTCSDK
import QRTCRoomClient
import Starscream

typealias RoomClientSDK = RoomClient100

public class QrtcFlutterIosPlugin: NSObject, FlutterPlugin, RoomListener {

    let logTag = "[QrtcFlutterIosPlugin]"
    var client: RoomClientSDK?

    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "qrtc_flutter_ios_plugin", binaryMessenger: registrar.messenger())
        let instance = QrtcFlutterIosPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if call.method == "createOrEnterRoom" {
                guard let args = call.arguments as? [String: Any],
                      let serverUrl = args["serverUrl"] as? String,
                      let sdkAppId = args["sdkAppId"] as? String,
                      let userSig = args["userSig"] as? String,
                      let userId = args["userId"] as? String,
                      let userName = args["userName"] as? String,
                      let roomId = args["roomId"] as? String,
                      let acceptLanguage = args["acceptLanguage"] as? String else {
                    result(FlutterError(code: "INVALID_ARGUMENTS", message: "Invalid arguments", details: nil))
                    return
                }

                createOrEnterRoom(serverUrl, sdkAppId: sdkAppId, userSig: userSig, userId: userId, userName: userName, roomId: roomId, acceptLanguage: acceptLanguage) { success in
                    result(success)
                }
            } else {
                result(FlutterMethodNotImplemented)
            }
    }

    func createOrEnterRoom(_ serverUrl: String, sdkAppId: String, userSig: String, userId: String, userName: String, roomId: String, acceptLanguage: String, callback: @escaping (Bool) -> Void) {
        self.client = RoomClientSDK.sharedInstance()

        var config = QRTCParams()
        // config.serverUrl = "rtc.callpro.mn/websocket"
        // config.sdkAppId = "vLFiFqMbXXk1GCqJVtySqn"
        // config.userSig = ""
        // config.userId = "test01_1111"
        // config.userName = "iOSTest01"
        // config.roomId = "vLFiFqMbXXk1GCqJVtySqn_test01"
        // config.acceptLanguage = "zh-CN"

        config.serverUrl = serverUrl
        config.sdkAppId = sdkAppId
        config.userSig = userSig
        config.userId = userId
        config.userName = userName
        config.roomId = roomId
        config.acceptLanguage = acceptLanguage
        config.xConferenceToken = "001eJxTYPipcfpB5fIJn07P5HovOUXt+dP9mtOZrnelfp+6SdDQYeJ+MYYyH7dMt0LfpIiIbEN350KvsJLK4MI8f6ny5Abjh4xt4VIsjAyMDCxADOIzgUlmMMkCJhUYzFPMjYzNTFOTLC2MTSxMjS3NU41TjdMsU0zMDJJSUhK5GIwsLIyMTQyNzI0B1NEu5w=="

        RoomClientSDK.sharedInstance().roomListener = self

        let encoderParams = QRTCVideoEncParams(
            videoResolution: QRTCVideoResolution.QRTCVideoResolution_480_360,
            resMode: QRTCVideoResolutionMode.QRTCVideoResolutionModePortrait,
            videoFps: 15,
            minVideoBitrate: 200,
            maxVideoBitrate: 500,
            enableAdjustRes: true
        )

        RoomClientSDK.sharedInstance().setVideoEncoderParam(param: encoderParams)
        RoomClientSDK.sharedInstance().enterRoom(params: config, scene: .VideoCall)
    }
    
    public func onEnterRoom(result: Int64, reason: String?) {
        print("\(logTag) on EnterRoom duration=\(result)")
        RoomClientSDK.sharedInstance().startLocalAudio(mute: false){ [weak self]success in
            if success {
            }else{
            }
        }
    }
    
    public func onExitRoom(reason: Int) {
        print("\(logTag) on EnterRoom reason=\(reason)")
    }
    
    public func onRemoteUserEnterRoom(userId: String, userInfo: QRTCRoomClient.QRTCUserInfo) {
        print("\(logTag) onRemoteUserEnterRoom userId: \(String(describing: userId))")
    }
    
    public func onRemoteUserLeaveRoom(userId: String, reason: Int) {
        print("\(logTag) onRemoteUserLeaveRoom userId:\(String(describing: userId))")
    }
    
    public func onUserShareAvailable(userId: String, available: Bool, paused: Bool?) {
        print("\(logTag) onUserShareAvailable userId: \(String(describing: userId)), available: \(available)")
    }
    
    public func onScreenCaptureStarted() {
        debugPrint("log: onScreenCaptureStarted")
    }
    
    public func onScreenCapturePaused(reason: Int32) {
        debugPrint("log: onScreenCapturePaused: " + "\(reason)")
    }
    
    public func onScreenCaptureResumed(reason: Int32) {
        debugPrint("log: onScreenCaptureResumed: " + "\(reason)")
    }
    
    public func onScreenCaptureStoped(reason: Int32) {
        debugPrint("log: onScreenCaptureStoped: " + "\(reason)")
    }
    
    public func onNetworkQuality(localQuality: QRTCRoomClient.QRTCQuality, remoteQuality: QRTCRoomClient.QRTCQuality) {
        
    }
    
    public func onLocalVideoStats(stats: QRTCRoomClient.QRTCRealTimeStats) {
        
    }
    
    public func onLocalAudioStats(stats: QRTCRoomClient.QRTCRealTimeStats) {
        
    }
    
    public func onRemoteVideoStats(userId: String, stats: QRTCRoomClient.QRTCRealTimeStats) {
        
    }
    
    public func onRemoteAudioStats(userId: String, stats: QRTCRoomClient.QRTCRealTimeStats) {
        
    }
    
    public func onMediasoupError(errorMessage: String) {
        print("\(logTag) onMediasoupError errorMessage=\(errorMessage)")
    }
    
    public func onAudioRouteChanged(route: QRTCRoomClient.QRTCAudioRoute, fromRoute: QRTCRoomClient.QRTCAudioRoute) {
        
    }
    
    public func onUserSpeaking(userId: String, action: String) {
        
    }
    
    public func onPageUserInfo(userCount: Int, pageCount: Int, currentPage: Int, currentUserCount: Int) {
        
    }
    
    public func onCustomCommand(_ command: String) {
        
    }
    
    public func onDisplayNameChanged(userId: String, displayName: String) {
        
    }
    
    public func onSDKLog(_ logMsg: String) {
        
    }
    
    public func onConnectionLost() {
        
    }
    
    public func onTryToReconnect() {
        
    }
    
    public func onConnectionRecovery() {
        
    }
    
    public func onConnectionTimeout() {
        
    }
    
    public func onErrorMsg(errorCode: Int, errorMsg: String) {
        print("\(logTag) onErrorMsg errorCode=\(errorCode), errorMsg=\(errorMsg)")
    }
    
    public func onWarningMsg(warningMsg: String) {
        print("\(logTag) onWarningMsg warningMsg=\(warningMsg)")
    }
    
    public func onRecvCustomCmdMsg(peerId: String, cmdId: Int, seq: Int, data: String) {
    
    }
    
    public func onUserVideoAvailable(userId: String, available: Bool) {
         print("\(logTag) onUserVideoAvailable userId: \(String(describing: userId)), available: \(available)")
    }
    
    public func onUserAudioAvailable(userId: String, available: Bool) {
         print("\(logTag) onUserAudioAvailable userId: \(String(describing: userId)), available: \(available)")
         if available {
            RoomClientSDK.sharedInstance().startRemoteAudio(userId:userId){ success,info in

            }
        }else{
            //do nothing
        }
    }
}
