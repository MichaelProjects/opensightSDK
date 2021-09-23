import 'package:analytics_flutter/src/apiClient.dart';
import 'package:analytics_flutter/src/collection.dart';
import 'package:analytics_flutter/src/conf.dart';
import 'package:analytics_flutter/src/nativlayer.dart';

class OpensightSDK {
  static Config _config_object = Config.def();

  static Future<void> initApp(Map config) async {
    _config_object = Config.fromJson(config);
    //_config_object = await NativeLayer.getConfig();

    print("Config: $_config_object");
    Collection data = await Collection.collect();
    await AnalyticsApiClient()
        .dispatchData(data.prepareToSend(), _config_object);
  }
}
