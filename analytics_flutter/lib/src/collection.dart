import 'nativlayer.dart';
import 'package:uuid/uuid.dart';

class Collection {
  String sessionId;
  String os;
  String deviceSize;
  final DateTime collectedTime = DateTime.now();

  Collection(
      {required this.sessionId, required this.os, required this.deviceSize});

  static collect() async {
    return Collection(
        sessionId: Uuid().toString(),
        deviceSize: await NativeLayer.determineDisplaysize(),
        os: await NativeLayer.determineOs());
  }

  prepareToSend() {
    // parse the data into the excpeted structure for the analytics_api
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
