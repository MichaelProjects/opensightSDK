import 'dart:async';

import 'package:flutter/services.dart';

class CosmicmetricsSdk {
  static const MethodChannel _channel =
      const MethodChannel('cosmicmetrics_sdk');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
