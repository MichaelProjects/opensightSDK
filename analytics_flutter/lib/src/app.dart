import 'package:analytics_flutter/src/apiClient.dart';
import 'package:analytics_flutter/src/collection.dart';
import 'package:analytics_flutter/src/nativlayer.dart';

class OpensightSDK {
  static Map _config_object = {};

  static Future<void> initApp() async {
    _config_object = await NativeLayer.getConfig();
    Collection data = await Collection.collect();
    await AnalyticsApiClient().dispatchData(data.prepareToSend());
  }
}
