import 'package:shared_preferences/shared_preferences.dart';

class PresistencesLayer {
  final String storeKey = "io.stracity";

  Future<bool> isNewUser() async {
    bool isNew = true;
    SharedPreferences pref = await SharedPreferences.getInstance();
    var result = pref.getBool(storeKey + "isNewUser");
    if (result != null) {
      isNew = result;
    }
    return isNew;
  }

  Future<void> storeUserState(bool isNew) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool(storeKey + "isNewUser", isNew);
  }
}
