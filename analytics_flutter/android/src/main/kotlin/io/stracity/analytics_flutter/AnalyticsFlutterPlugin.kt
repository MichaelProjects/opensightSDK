package io.stracity.analytics_flutter

import androidx.annotation.NonNull
import android.content.Context
import android.util.DisplayMetrics
import java.io.File

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
        var conf: String = loadServiceData("opensight_service.json")
        result.success(conf)
      }
      "getLangCode" -> {
        val langCode: String? = getSystemLang();
        result.success(langCode)
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

public fun loadServiceData(fileName: String): String {
  val jsonString: String
  try {
    val jsonString: String = File(fileName).readText(Charsets.UTF_8)
    return jsonString
  } catch (error: Exception) {
      return ""
  }
  return jsonString
}

public fun getSystemLang() -> String?{
  val langCode: String? = Locale.getDefault().getLanguage() as String?
  return langCode
}