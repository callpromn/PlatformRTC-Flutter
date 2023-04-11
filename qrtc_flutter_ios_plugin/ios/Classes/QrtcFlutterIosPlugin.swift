import Flutter
import UIKit

import QRTCSDK
import QRTCRoomClient

typealias RoomClientSDK = RoomClient100

public class QrtcFlutterIosPlugin: NSObject, FlutterPlugin, RoomListener {
    
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

        let rtcParams = QRTCParams(
            serverUrl: serverUrl,
            sdkAppId: sdkAppId,
            userSig: userSig,
            userId: userId,
            userName: userName,
            roomId: roomId,
            acceptLanguage: acceptLanguage
        )

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
        RoomClientSDK.sharedInstance().enterRoom(params: rtcParams, scene: .VideoCall)

        // Assuming the success flag is based on the onEnterRoom event
        // Add a listener to handle the onEnterRoom event
        self.onEnterRoomCompletion = { success in
            callback(success)
        }
    }
    
    private var onEnterRoomCompletion: ((Bool) -> Void)?
    
    public func onEnterRoom(result: Int64, reason: String?) {
        onEnterRoomCompletion?(result == 0)
        onEnterRoomCompletion = nil
    }
    
    public func onExitRoom(reason: Int) {
        
    }
    
    public func onRemoteUserEnterRoom(userId: String, userInfo: QRTCRoomClient.QRTCUserInfo) {
        
    }
    
    public func onRemoteUserLeaveRoom(userId: String, reason: Int) {
        
    }
    
    public func onUserShareAvailable(userId: String, available: Bool, paused: Bool?) {
        
    }
    
    public func onScreenCaptureStarted() {
        
    }
    
    public func onScreenCapturePaused(reason: Int32) {
        
    }
    
    public func onScreenCaptureResumed(reason: Int32) {
        
    }
    
    public func onScreenCaptureStoped(reason: Int32) {
        
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
        
    }
    
    public func onWarningMsg(warningMsg: String) {
        
    }
    
    public func onRecvCustomCmdMsg(peerId: String, cmdId: Int, seq: Int, data: String) {
    
    }
    
    public func onUserVideoAvailable(userId: String, available: Bool) {
        
    }
    
    public func onUserAudioAvailable(userId: String, available: Bool) {
        
    }
}
