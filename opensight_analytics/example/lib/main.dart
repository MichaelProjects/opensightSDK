import 'package:flutter/material.dart';
import 'package:opensight_analytics/opensight_analytics.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  OpensightAnalytics.initApp({
    "url": "https://metrics.stackblog.io",
    "app_id": "ea43343b-2a0d-4feb-92a1-67e0eb8268f4",
    "name": "stackblog",
    "token": "12414135330434544387",
    "package_name": "io.stackblog"
  });
  runApp(const ExampleApp());
}

class ExampleApp extends StatelessWidget {
  const ExampleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Scaffold(body: Home()));
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Opensight Demo App"));
  }
}
