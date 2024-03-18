//
//  AppDelegate.swift
//  LRAtsSDKSample
//
//  Created by Najdan Tomic on 2/9/24.
//
//  Copyright © 2024 Liveramp. All rights reserved.
//

import UIKit
import AppTrackingTransparency

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window:UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()
        window?.makeKeyAndVisible()
        return true
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Make sure you have ATT consent and user consent to initialize and get envelope successfully
        ConsentManager.simulateUserConsent()
        ATTrackingManager.requestTrackingAuthorization { status in
            switch status {
            case .authorized:
                // Tracking authorization dialog was shown and we are authorized
                print("Authorized")
            case .denied:
                // Tracking authorization dialog was shown and permission is denied
                print("Denied")
            case .notDetermined:
                // Tracking authorization dialog has not been shown
                print("Not Determined")
            default:
                print("Unknown")
            }
        }
    }
}
