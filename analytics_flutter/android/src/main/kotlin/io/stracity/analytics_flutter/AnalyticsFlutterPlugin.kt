package io.stracity.analytics_flutter

import androidx.annotation.NonNull
import android.content.Context


import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** AnalyticsFlutterPlugin */
class AnalyticsFlutterPlugin: FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "io.opensight")
    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    when (call.method){
      "getPlatformVersion" -> {result.success("Android ${android.os.Build.VERSION.RELEASE}")}
      "displaySize" -> {
        val displayMetrics = DisplayMetrics()
        var width = displayMetrics.widthPixels
        var height = displayMetrics.heightPixels
        result.success("${width}x${height}")
      }
      "getOpensightConfig" -> {
        var conf = loadServiceData("opensight_service.json")
        return conf
      }
      else -> {
        result.notImplemented()
      }
    }
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}

public fun loadServiceData(fileName: String): String? {
  val jsonString: String
  try {
    val jsonString: String = File(fileName).readText(Charsets.UTF_8)
    return jsonString
  } catch (ioException: IOException) {
      ioException.printStackTrace()
      return null
  }
  return jsonString
}