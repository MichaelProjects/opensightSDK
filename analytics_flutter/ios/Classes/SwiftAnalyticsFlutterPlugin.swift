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
        case "getOpensightConfig":
            result(readConf())
        default:
        result("Not Implemented")
        
    }

}

public readConf(){
    if let path = NSBundle.mainBundle().pathForResource("opensight_service", ofType: "json")
    {
        if let jsonData = NSData(contentsOfFile: path, options: .DataReadingMappedIfSafe, error: nil)
        {
            if let jsonResult: NSDictionary = NSJSONSerialization.JSONObjectWithData(jsonData, options: NSJSONReadingOptions.MutableContainers, error: nil) as? NSDictionary
            {
                return jsonResult
            }
         }
    }
}

public getDisplaySize(){
    let screenSize: CGRect = UIScreen.main.bounds
    let screenWidth = screenSize.width
    let screenHeight = screenSize.height
    return screenWidth + "x" + screenHeight
}

