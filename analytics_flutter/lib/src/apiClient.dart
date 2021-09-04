import 'package:http/http.dart' as http;
import 'dart:developer' as developer;

class AnalyticsApiClient {
  Future dispatchData(Map payload) async {
    String token = "";
    try {
      Uri uri = Uri.parse("");
      Map<String, String> headers = {
        "Content-Type": "json",
        "Authorization": "Bearer $token"
      };
      var response = await http.post(uri, headers: headers, body: payload);
      if (response.statusCode != 202) {
        print("Error while connection to analytic_api");
        throw "could not connect to analytic api server";
      }
    } catch (e) {
      developer.log(e.toString());
    }
  }
}
