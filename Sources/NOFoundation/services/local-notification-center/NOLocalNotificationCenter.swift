//
//  NOLocalNotificationCenter.swift
//  PicFindr
//
//  Created by hcyrig on 29.04.2022.
//  Copyright © 2022 Kostiantyn Girych a.k.a "hcyrig". All rights reserved.
//

import Foundation
import UserNotifications

public final class NOLocalNotificationCenter {
  
  public enum Consts {
    
    static let timeInterval: TimeInterval = 0.1
  }
  
  public static let shared = NOLocalNotificationCenter()
  
  public func postNotification(
    with title: String,
    and body: String) {
      
      UNUserNotificationCenter.current()
        .requestAuthorization(
          options: [.alert, .badge, .sound]) { success, error in
          
          guard success else {
            if let error = error { DEBUGLogger.log(error) }
            return
          }
          
          let content = UNMutableNotificationContent()
          content.title = title
          content.body = body
          content.sound = UNNotificationSound.default
          
          let trigger = UNTimeIntervalNotificationTrigger(
            timeInterval: Consts.timeInterval,
            repeats: false)
          
          let request = UNNotificationRequest(
            identifier: UUID().uuidString,
            content: content,
            trigger: trigger)
          
          UNUserNotificationCenter
            .current()
            .add(request) { (error) in
            
              guard let error = error else { return }
              
              DEBUGLogger.log(error)
          }
        }
    }
  
  private init() {}
}
