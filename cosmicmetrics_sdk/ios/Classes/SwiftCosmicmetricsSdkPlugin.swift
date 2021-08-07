import Flutter
import UIKit

public class SwiftCosmicmetricsSdkPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "cosmicmetrics_sdk", binaryMessenger: registrar.messenger())
    let instance = SwiftCosmicmetricsSdkPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result("iOS " + UIDevice.current.systemVersion)
  }
}
