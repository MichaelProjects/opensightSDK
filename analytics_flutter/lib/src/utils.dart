import 'dart:convert';
import 'dart:io';

compressData(Map data) {
  var raw_data = utf8.encode(data.toString());
  var result = GZipCodec(level: 9).encode(raw_data);
  print("before: ${data.toString().length}");
  print("after: ${result.length}");
}
