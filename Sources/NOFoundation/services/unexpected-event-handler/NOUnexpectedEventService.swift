//
//  NOUnexpectedEventService.swift
//  NOFoundation
//
//  Copyright © 2022 Kostiantyn Girych a.k.a "hcyrig". All rights reserved.
//

import Foundation
import SystemConfiguration

open class NOUnexpectedEventService: NSObject {
  
  public typealias UnexpectedEventHandersCallback = (String) -> Void
  
  public var handlers: [UnexpectedEventHandler]
  
  public var eventCallback: UnexpectedEventHandersCallback?
  
  public init(_ handlers: [UnexpectedEventHandler],
              eventCallback: UnexpectedEventHandersCallback?) {
    self.handlers = handlers
    
    super.init()
    
    self.eventCallback = eventCallback
    
    register(handlers: handlers)
    bind(handlers: handlers)
  }
  
  deinit {
    
    unbind(handlers: handlers)
  }
  
  public func bind(handlers: [UnexpectedEventHandler]) {
    
    handlers
      .compactMap({ $0.notification })
      .forEach {
        
        ProcessNotification
          .observe(observer: self,
                   for: $0,
                   with: #selector(handleUnexcectedEventNotification(_:)))
      }
  }
  
  public func unbind(handlers: [UnexpectedEventHandler]) {
    
    handlers
      .compactMap({ $0.notification })
      .forEach({
        
        ProcessNotification.deobserve(observeer: self, for: $0)
      })
  }
  
  public func register(handlers: [UnexpectedEventHandler]) {
    
    handlers.forEach { $0.register() }
  }
  
  @objc public func handleUnexcectedEventNotification(_ notification: Notification) {
    
    if let notification: ApplicationSignalEventHander.Signal = notification.nestedOjb() {
      
      prepareReport(notification.description())
      
    } else if let notification: ApplicationExceptionEventHander.Exception = notification.nestedOjb() {
      
      prepareReport(notification.description())
    }
  }
  
  public var isSignaled = false
  public func prepareReport(_ stackTrace: String) {

    if isSignaled == true { return }
    isSignaled = true

    eventCallback?(stackTrace)
  }
}
