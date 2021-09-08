import 'package:shared_preferences/shared_preferences.dart';

class PresistencesLayer {
  final String storeKey = "io.opensight/";

  Future<bool> isNewUser() async {
    /// check if an exists for the given key below.
    /// if so it returns the needed value.
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
