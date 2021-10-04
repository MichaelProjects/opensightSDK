import 'package:flutter/material.dart';
import 'package:opensight_analytics/analytics_flutter.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Opensight_Analytics.initApp({
    "url": "http://apm.stackblog.io:28018",
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
