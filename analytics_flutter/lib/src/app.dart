import 'package:analytics_flutter/src/apiClient.dart';
import 'package:analytics_flutter/src/collection.dart';
import 'package:analytics_flutter/src/nativlayer.dart';

class OpensightSDK {
  static String _config_object = "";

  static Future<void> initApp() async {
    _config_object = await NativeLayer.getConfig();
    print("config: $_config_object");
    Collection data = await Collection.collect();
    await AnalyticsApiClient().dispatchData(data.prepareToSend());
  }
}
