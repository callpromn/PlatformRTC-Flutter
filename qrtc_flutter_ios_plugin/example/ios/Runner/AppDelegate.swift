import UIKit
import Flutter

// Remove the import for qrtc_flutter_ios_plugin
// import qrtc_flutter_ios_plugin

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        // Remove the manual registration for QrtcFlutterIosPlugin
        // let registrar = self.registrar(forPlugin: "QrtcFlutterIosPlugin")
        // QrtcFlutterIosPlugin.register(with: registrar!)

        GeneratedPluginRegistrant.register(with: self)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
}
