import Flutter
import UIKit

public class SwiftAnalyticsFlutterPlugin: NSObject, FlutterPlugin {

  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "io.opensight", binaryMessenger: registrar.messenger())
    let instance = SwiftAnalyticsFlutterPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "getPlatformVersion":
            result(String(format: "IOS %1$@", UIDevice.current.systemVersion))
            break;
        case "displaysize":
            result(getDisplaySize())
            break;
        case "getOpensightConfig":
            result(readConf())
            break;
        default:
            result("Not Implemented")
        }
    }
    
    private func readConf() -> Any {
        var conf = ""
        iif let filepath = Bundle.main.path(forResource: "opensight_conf", ofType: "json") {
            do {
                let contents = try String(contentsOfFile: filepath)
                print(contents)
            } catch {
                print("Error could not load file")
            }
        } else {
            print("Could not find opensight_service.json
        }
        return conf
    }

    private func getDisplaySize() -> String {
        let screenSize: CGRect = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        return String(format: "%2$@ + %1$@", screenWidth, screenHeight)
    }
    
}
