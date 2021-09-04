import 'package:analytics_flutter/src/nativlayer.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const platformMethodChannel = const MethodChannel('io.opensight');
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    platformMethodChannel
        .setMockMethodCallHandler((MethodCall methodCall) async {
      switch (methodCall.method) {
        case "displaysize":
          return "1000x1000";
        case "getPlatformVersion":
          return "42";
      }
    });
  });
  group('PluginPlatformChannels', () {
    test("can handle os determination", () async {
      expect(await NativeLayer.determineOs(), "Unkown");
    });
    test("can resolve os version", () async {
      expect(await NativeLayer.determineOsVersion(), "42");
    });
    test('can handle displaySize call', () async {
      expect(await NativeLayer.determineDisplaysize(), "1000x1000");
    });
  });
}
