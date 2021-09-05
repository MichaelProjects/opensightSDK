import 'package:analytics_flutter/src/collection.dart';

class OpensightSDK {
  static Future<void> initApp() async {
    Collection data = Collection.collect();
    data.prepareToSend();
  }
}
