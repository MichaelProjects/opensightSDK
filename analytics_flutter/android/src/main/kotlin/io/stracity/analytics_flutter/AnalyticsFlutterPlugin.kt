package io.stracity.analytics_flutter

import androidx.annotation.NonNull
import android.content.Context
import android.util.DisplayMetrics
import android.content.res.AssetManager;

import java.io.BufferedReader
import java.io.IOException
import java.io.InputStream
import java.io.InputStreamReader
import android.os.Build

import java.io.File

import java.util.Locale

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
        val langCode: String? = getSystemLang()
        result.success(langCode)
      }
      "getAppVersion" -> {
        val version: String? = getAppVersion()
        result.success(version)
      }
      "getDeviceType" -> {
        val deviceType: String = getPhoneDeviceName()
        result.success(deviceType)
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
  var string: String = ""
  val stringBuilder = StringBuilder()
  //var manager: AssetManager = AssetManager()
  //print(manager.list())
  return ""
}

public fun getSystemLang():String{
  val langCode: String = Locale.getDefault().getLanguage() as String
  return langCode
}
public fun getAppVersion():String {
  val version:String = Build.VERSION.RELEASE
  return version
}

fun getPhoneDeviceName():String {
  val model = Build.MODEL // returns model name
  return model;
}