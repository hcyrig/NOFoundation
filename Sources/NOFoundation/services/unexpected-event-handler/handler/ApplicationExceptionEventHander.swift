//
//  ApplicationExceptionEventHander.swift
//  ULCore
//
//  Created by hcyrig on 19.06.2022.
//

import Foundation
import SystemConfiguration

public class ApplicationExceptionEventHander: UnexpectedEventHandler {
  
  static var notification: Notification.Name {
    
    NSNotification.Name("com.noservice.exception.event.hander.notification")
  }
  
  public var notification: Notification.Name {
    
    ApplicationExceptionEventHander.notification
  }
  
  public init() { }
  
  public struct Exception {
    
    public let value: NSException
    
    public func description() -> String {
      
      "exception \(value.name) \(value.reason ?? .empty)"
    }
  }
  
  public func register() {
    
    NSSetUncaughtExceptionHandler {
      
      ApplicationExceptionEventHander.handle(event: $0)
    }
  }
  
  public static func handle(event: Any?) {
    
    guard let event = event,
          let eventObj = event as? NSException else { return }
    
    let exception = Exception(value: eventObj)
    
    ProcessNotification
      .post(
        name: ApplicationExceptionEventHander.notification,
        obj: exception)
  }
}
