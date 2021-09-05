import 'nativlayer.dart';
import 'package:uuid/uuid.dart';

class Collection {
  /// [Collection] contains all the needed data that will be sendet to the analtics_api.
  String sessionId;
  String os;
  String deviceSize;
  final DateTime collectedTime = DateTime.now();

  Collection(
      {required this.sessionId, required this.os, required this.deviceSize});

  static collect() async {
    /// [collect] calls all needed functions to get the needed data.
    return Collection(
        sessionId: Uuid().toString(),
        deviceSize: await NativeLayer.determineDisplaysize(),
        os: await NativeLayer.determineOs());
  }

  prepareToSend() {
    /// parse the data into the excpeted structure for the analytics_api
    Map data = {
      "creation_date": this.collectedTime.toString(),
      "os": this.os,
      "device_size": this.deviceSize,
      "session_length": "",
      "session_id": ""
    };
    return data;
  }
}
