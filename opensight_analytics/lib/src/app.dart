import '/src/apiClient.dart';
import '/src/collection.dart';
import '/src/conf.dart';
import '/src/session.dart';

class OpensightSDK {
  /// [OpensightSDK] is the public api for this plugin, it is simple to implement just call [OpensightSDK.initApp] and the function takes your config.
  ///
  /// example:
  ///
  /// Map config_data = {add your config data here}
  /// OpensightSDK.initApp(config_data)
  static Config _config_object = Config.def();

  static Future<void> initApp(Map config) async {
    _config_object = Config.fromJson(config);
    Collection data = await Collection.collect();
    await AnalyticsApiClient()
        .dispatchData(data.prepareToSend(), _config_object);
    tracking();
  }
}
