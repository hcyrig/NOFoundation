//
//  UnexpectedEventHandler.swift
//  NOFoundation
//
//  Copyright © 2022 Kostiantyn Girych a.k.a "hcyrig". All rights reserved.
//

import Foundation

public protocol UnexpectedEventHandler {
  
  var notification: Notification.Name { get }
  
  static func handle(event: Any?)
  
  func register()
}
