import 'dart:convert';

import 'package:http/http.dart' as http;
import 'dart:developer' as developer;

class AnalyticsApiClient {
  Future dispatchData(Map<String, dynamic> payload) async {
    String token = "";
    print(payload);
    try {
      Uri uri = Uri.parse(
          "http://apm.stackblog.io:28018/analytic/1914806b-dcb3-4f1e-a24b-1943093961ba/entry");
      var response = await http.post(uri, body: jsonEncode(payload));
      print(response.body);
      if (response.statusCode != 202) {
        print("Error while connection to analytic_api");
        throw "could not connect to analytic api server";
      }
    } catch (e) {
      print("afb");
      print(e.toString());
    }
  }
}
