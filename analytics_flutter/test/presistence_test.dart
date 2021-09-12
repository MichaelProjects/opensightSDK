import 'package:analytics_flutter/src/persistence.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setUp(() {
    Map<String, Object> data = {
      PresistencesLayer().storeKey + "isNewUser": false
    };
    SharedPreferences.setMockInitialValues(data);
  });
  group("can handle the presistence test", () {
    test("can handle is user new", () async {
      await PresistencesLayer().storeUserState(true);
      bool isNew = await PresistencesLayer().isNewUser();
      expect(isNew, true);
    });
  });
}
