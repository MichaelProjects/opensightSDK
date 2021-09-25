import 'dart:convert';

import 'package:analytics_flutter/src/conf.dart';
import 'package:analytics_flutter/src/utils.dart';
import 'package:http/http.dart' as http;

class AnalyticsApiClient {
  Future dispatchData(Map<String, dynamic> payload, Config config) async {
    print(payload);
    compressData(payload);
    try {
      Uri uri = Uri.parse(
          "${config.analytics_api}/analytic/1914806b-dcb3-4f1e-a24b-1943093961ba/entry");
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
