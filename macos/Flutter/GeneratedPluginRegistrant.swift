//
//  Generated file. Do not edit.
//

import FlutterMacOS
import Foundation

import device_info_plus
import platform_device_id
import screen_retriever_macos
import shared_preferences_foundation
import webview_flutter_wkwebview
import window_manager

func RegisterGeneratedPlugins(registry: FlutterPluginRegistry) {
  DeviceInfoPlusMacosPlugin.register(with: registry.registrar(forPlugin: "DeviceInfoPlusMacosPlugin"))
  PlatformDeviceIdMacosPlugin.register(with: registry.registrar(forPlugin: "PlatformDeviceIdMacosPlugin"))
  ScreenRetrieverMacosPlugin.register(with: registry.registrar(forPlugin: "ScreenRetrieverMacosPlugin"))
  SharedPreferencesPlugin.register(with: registry.registrar(forPlugin: "SharedPreferencesPlugin"))
  WebViewFlutterPlugin.register(with: registry.registrar(forPlugin: "WebViewFlutterPlugin"))
  WindowManagerPlugin.register(with: registry.registrar(forPlugin: "WindowManagerPlugin"))
}
