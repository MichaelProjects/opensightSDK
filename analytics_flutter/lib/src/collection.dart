import 'nativlayer.dart';
import 'package:uuid/uuid.dart';

class Collection {
  /// [Collection] contains all the needed data that will be sendet to the analtics_api.
  final DateTime collectedTime = DateTime.now();
  String os;
  String deviceSize;
  bool new_user;
  String country;
  int last_session;
  String device_type;
  String version;

  Collection(
      {required this.os,
      required this.deviceSize,
      required this.new_user,
      required this.country,
      required this.last_session,
      required this.device_type,
      required this.version});

  static collect() async {
    /// [collect] calls all needed functions to get the needed data.
    return Collection(
        os: await NativeLayer.determineOs(),
        deviceSize: await NativeLayer.determineDisplaysize(),
        new_user: false,
        country: '',
        last_session: 111,
        device_type: '',
        version: '');
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
