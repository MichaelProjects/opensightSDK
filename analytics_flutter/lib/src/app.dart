import 'dart:isolate';
import 'package:analytics_flutter/src/apiClient.dart';
import 'package:analytics_flutter/src/collection.dart';
import 'package:analytics_flutter/src/conf.dart';
import 'package:analytics_flutter/src/session.dart';
import 'package:flutter_isolate/flutter_isolate.dart';

class OpensightSDK {
  static Config _config_object = Config.def();

  static Future<void> initApp(Map config) async {
    _config_object = Config.fromJson(config);
    //_config_object = await NativeLayer.getConfig();

    print("Config: $_config_object");
    Collection data = await Collection.collect();
    await AnalyticsApiClient()
        .dispatchData(data.prepareToSend(), _config_object);

    tracking();
  }
}

Future sendReceive(SendPort port, msg) {
  ReceivePort response = ReceivePort();
  port.send([msg, response.sendPort]);
  return response.first;
}

tracking() async {
  ReceivePort receivePort = ReceivePort();
  await FlutterIsolate.spawn(startTracking, receivePort.sendPort);
}
