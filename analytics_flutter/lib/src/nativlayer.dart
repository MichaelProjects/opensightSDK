import 'dart:io';

import 'package:flutter/services.dart';
import 'dart:developer' as developer;

class NativeLayer {
  /// with [NativeLayer] opensight calls native code, or functions (written in swift, kotlin).
  static const platform = MethodChannel("io.opensight");

  static Future<String> determineOs() async {
    String os = "Unkown";
    if (Platform.isIOS) {
      os = "IOS";
    }
    if (Platform.isAndroid) {
      os = "Android";
    }
    return os;
  }

  static Future<String> determineOsVersion() async {
    final String result = await platform.invokeMethod("getPlatformVersion");
    return result;
  }

  static Future<String> determineDisplaysize() async {
    String displaySize = "";
    try {
      final String result = await platform.invokeMethod("displaysize");
      displaySize = result;
      print(result);
    } catch (e) {
      developer.log(e.toString());
    }
    return displaySize;
  }
}