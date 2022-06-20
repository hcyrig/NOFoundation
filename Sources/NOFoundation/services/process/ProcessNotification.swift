//
//  ProcessNotification.swift
//  NOFoundation
//
//  Copyright © 2022 Kostiantyn Girych a.k.a "hcyrig". All rights reserved.
//

import Foundation

public enum ProcessNotification {
  
  public static var notificationCenter: NotificationCenter {
    NotificationCenter
      .default
  }
  
  public static func observe(
    observer: Any,
    for notificationName: Notification.Name,
    with selector: Selector) {
      
      DispatchQueue.main.async {
 
        notificationCenter
          .addObserver(observer,
                       selector: selector,
                       name: notificationName,
                       object: nil)
      }
    }
  
  public static func deobserve(
    observeer: Any,
    for notificationName: Notification.Name) {
      
      DispatchQueue.main.async {
        
        notificationCenter
          .removeObserver(observeer,
                          name: notificationName,
                          object: nil)
      }
    }
  
  public static func post(
    name: Notification.Name,
    obj: Any? = nil,
    sender: Any? = nil) {
      
      DispatchQueue.main.async {
        
        notificationCenter
          .post(name: name,
                object: sender,
                userInfo: obj != nil ? [name: obj!] : nil)
      }
    }
}
