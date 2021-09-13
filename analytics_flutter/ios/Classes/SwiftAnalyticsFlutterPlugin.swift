import Flutter
import UIKit

public class SwiftAnalyticsFlutterPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "io.opensight", binaryMessenger: registrar.messenger())
    let instance = SwiftAnalyticsFlutterPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

    public func handle(_ call: FlutterMethodChannel, result: @escaping FlutterResult){
        switch call.method {
        case "getPlatformVersion":
            result(String(format: "IOS %1$@", UIDevice.current.systemVersion))
            break;
        case "dispalySize":
            result(getDisplaySize())
            break;
        case "getOpensightConfig":
            result(readJSONFromFile(fileName: "opensight_service.json"))
            break;
        default:
            result("Not Implemented")
        }
    }
    
    public func readJSONFromFile(fileName: String) -> Any? {
      var json: Any?
      if let path = Bundle.main.path(forResource: fileName, ofType: "json") {
          do {
              let fileUrl = URL(fileURLWithPath: path)
              // Getting data from JSON file using the file URL
              let data = try Data(contentsOf: fileUrl, options: .mappedIfSafe)
              json = try? JSONSerialization.jsonObject(with: data)
          } catch {
              // Handle error here
          }
      }
      return json
  }

public func getDisplaySize() -> String {
    let screenSize: CGRect = UIScreen.main.bounds
    let screenWidth = screenSize.width
    let screenHeight = screenSize.height
    return String(format: "%2$@ + %1$@", screenWidth, screenHeight)
}


}
