//
//  NotificationHandler.swift
//  bettr
//
//  Created by Henry Thomas on 26/10/2022.
//

import Foundation
import UserNotifications


class NotificationHandler: ObservableObject{
    
    
    static let shared = NotificationHandler()
    
    func requestNotificationPermission(completion: @escaping (Bool) -> Void){
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]){ (success, error) in
            if error == nil{
                completion(true) //User granted notification permission
            } else {
                completion(false) //User denied giving notification permission
            }
            
        }
    }
    
    func endOfDayReminder(inCompleteCount: Int){
        var dateComponents = DateComponents()
        dateComponents.hour = 20
        dateComponents.minute = 00
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        let title = "bettr"
        var bodyData = ""
        if inCompleteCount == 1 {
             bodyData = "You have \(inCompleteCount) task remaining today"
        } else {
             bodyData = "You have \(inCompleteCount) tasks remaining today"
        }
        
        if inCompleteCount > 0 {
            notificationQueue(id: "reminder-1", trigger: trigger, title: title, bodyData: bodyData)
        }
        else{
            UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: ["reminder-1"])
        }
    }
    
    func notificationQueue(id: String, trigger: UNNotificationTrigger, title: String, bodyData: String){
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = bodyData
        content.sound = .default
        let request = UNNotificationRequest(identifier: id, content: content, trigger: trigger)
        print("sending notification: \(content.body)")
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Notification Error: \(error)")
            }
        }
    }
    
        

    
}

    
