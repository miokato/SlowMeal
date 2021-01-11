//
//  UserNotifMaker.swift
//  SlowMeal
//
//  Created by mio kato on 2021/01/11.
//

import UIKit
import UserNotifications


class UserNotifMaker {
    
    static var shared = UserNotifMaker()
    
    public func add(title: String, body: String, hour: Int, minute: Int) {
        let content = makeContent(title: title, body: body)
        let trigger = makeCalenderTrigger(hour: hour, minute: minute)
        addUserNotification(trigger: trigger, content: content)
    }

    private func addUserNotification(trigger: UNCalendarNotificationTrigger, content: UNNotificationContent) {
        let uuidString = UUID().uuidString
        let request = UNNotificationRequest(identifier: uuidString,
                                            content: content,
                                            trigger: trigger)
        let center = UNUserNotificationCenter.current()
        center.add(request, withCompletionHandler: nil)
    }
    
    private func makeCalenderTrigger(hour: Int, minute: Int) -> UNCalendarNotificationTrigger {
        var dateComponents = DateComponents()
        dateComponents.hour = hour
        dateComponents.minute = minute
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        return trigger
    }
    
    private func makeContent(title: String, body: String) -> UNMutableNotificationContent {
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.sound = UNNotificationSound.default
        return content
    }
}
