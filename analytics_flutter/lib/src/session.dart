import 'dart:isolate';

import 'package:analytics_flutter/src/persistence.dart';

class Session {
  int length = 0;

  void increaseLength() {
    length += 10;
  }

  int store() {
    return length;
  }

  Map toJson() {
    return {
      "length": length,
    };
  }
}

startTracking(SendPort sendPort) async {
  var session = new Session();
  while (true) {
    await Future.delayed(Duration(seconds: 10));
    session.increaseLength();
    await PresistencesLayer().storeSession(session);
  }
}
