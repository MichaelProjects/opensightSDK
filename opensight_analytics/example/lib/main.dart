import 'package:flutter/material.dart';
import 'package:opensight_analytics/opensight_analytics.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  OpensightAnalytics.initApp({
    "url": "here your url",
    "name": "stackblog",
    "api_key": "hereyourkey",
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
