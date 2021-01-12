//
//  AppDelegate.swift
//  SlowMeal
//
//  Created by mio kato on 2021/01/11.
//

import UIKit
import UserNotifications
import RealmSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // User notification
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.badge, .alert, .sound]) { (granted, error) in
            if error != nil {
                print(error?.localizedDescription)
            }
            
            if granted {
                center.delegate = self
                
                UserNotifMaker.shared.add(title: "朝ごはん",
                                          body: Constants.USER_NOTIFY_BODY,
                                          hour: Constants.BREAKFAST_HOUR,
                                          minute: Constants.BREAKFAST_MINUTE)
                UserNotifMaker.shared.add(title: "お昼ごはん",
                                          body: Constants.USER_NOTIFY_BODY,
                                          hour: Constants.LUNCH_HOUR,
                                          minute: Constants.LUNCH_MINUTE)
                UserNotifMaker.shared.add(title: "晩ごはん",
                                          body: Constants.USER_NOTIFY_BODY,
                                          hour: Constants.DINNER_HOUR,
                                          minute: Constants.DINNER_MINUTE)
            }
            
        }
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
}

extension AppDelegate: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.badge, .sound])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
        completionHandler()

    }
}

