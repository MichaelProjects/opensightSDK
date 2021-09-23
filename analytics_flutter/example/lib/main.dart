import 'package:analytics_flutter/analytics_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  OpensightSDK.initApp({
    "url": "https://apm.stackblog.io:28018",
    "name": "stackblog",
    "api_key": "5305728986743839588",
    "package_name": "io.stackblog"
  });
  runApp(ExampleApp());
}

class ExampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(body: Home()));
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(child: Center(child: Text("Opensight Demo App")));
  }
}
