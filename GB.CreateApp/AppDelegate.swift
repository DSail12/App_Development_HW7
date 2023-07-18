//
//  AppDelegate.swift
//  HW7
//
//  Created by Eugene Zvyagin on 17.07.2023.
//

import UserNotifications
import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    let notificationCenter = UNUserNotificationCenter.current()
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let autorizationOptions: UNAuthorizationOptions = [.alert, .sound, .badge]; notificationCenter.requestAuthorization(options: autorizationOptions) {
            (isAllow, error) in
            if !isAllow {
                print("Запрещены уведомления")
            }
        }
        return true
    }
    func sendNotification() {
        let notificationContent = UNMutableNotificationContent()
        notificationContent.sound = UNNotificationSound.default
        notificationContent.title = "Уведомление"
        notificationContent.body = "Уведомление"
        notificationContent.badge = 1
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: "notification", content: notificationContent, trigger: trigger)
        notificationCenter.add(request) { (error) in
            print("Error")
        }
    }
    // MARK: UISceneSession Lifecycle
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly //after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
}
