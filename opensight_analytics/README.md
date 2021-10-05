# Opensight for Flutter

## Quickstart

Move the generated config file from the Opensight Dashboard into the root folder of your app. Then add this code snipped to your app.

```dart
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Opensight_Analytics.initApp({config data});
  runApp(ExampleApp());
}
...
```

and now your app is connected with the opensight service.

## Getting Started
Documentation comming soon ->

To get started with Opensight please, follow the instructions on http://opensight.io/docs

## issues or feedback
Please file specific issues, bugs, or feature requests in our [issue tracker](https://github.com/MichaelProjects/opensightSDK/issues/new)