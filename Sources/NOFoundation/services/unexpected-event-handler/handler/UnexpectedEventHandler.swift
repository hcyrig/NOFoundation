//
//  UnexpectedEventHandler.swift
//  ULCore
//
//  Created by hcyrig on 19.06.2022.
//

import Foundation

public protocol UnexpectedEventHandler {
  
  var notification: Notification.Name { get }
  
  static func handle(event: Any?)
  
  func register()
}
