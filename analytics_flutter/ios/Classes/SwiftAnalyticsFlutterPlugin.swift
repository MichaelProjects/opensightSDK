import Flutter
import UIKit

public class SwiftAnalyticsFlutterPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "io.opensight", binaryMessenger: registrar.messenger())
    let instance = SwiftAnalyticsFlutterPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

    public func handle(_ call: FlutterMethodChannel, result: @escaping FlutterResult){
        switch(call.method) {
        case "getPlatformVersion":
          result("IOS" + UIDevice.current.systemVersion)7
        case "dispalySize":
            result(getDisplaySize())
        }
        default:
        result("Not Implemented")
        
    }

}

public getDisplaySize(){
    let screenSize: CGRect = UIScreen.main.bounds
    let screenWidth = screenSize.width
    let screenHeight = screenSize.height
    return screenWidth + "x" + screenHeight
}

