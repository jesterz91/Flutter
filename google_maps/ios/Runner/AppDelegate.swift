import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    // 구글 맵
    [GMSServices provideAPIKey: @"YOUR_API_KEY"];
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
