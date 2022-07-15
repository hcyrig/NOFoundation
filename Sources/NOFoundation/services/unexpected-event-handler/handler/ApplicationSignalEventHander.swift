//
//  ApplicationSignalEventHander.swift
//  NOFoundation
//
//  Copyright © 2022 Kostiantyn Girych a.k.a "hcyrig". All rights reserved.
//

import Foundation
import SystemConfiguration

public class ApplicationSignalEventHander: UnexpectedEventHandler {
  
  public static var notification: Notification.Name {
    
    NSNotification.Name("com.noservice.signal.event.hander.notification")
  }
  
  public var notification: Notification.Name {
    
    ApplicationSignalEventHander.notification
  }
  
  public init() { }
  
  public enum Signal: CaseIterable {
    
    case _EXC_BREAKPOINT
    case _EXC_CRASH
    case _EXC_BAD_ACCESS
    case _EXC_BAD_INSTRUCTION
    case _SIGINT
    case _SIGABRT
    case _SIGKILL
    case _SIGTRAP
    case _SIGBUS
    case _SIGSEGV
    case _SIGHUP
    case _SIGTERM
    case _SIGILL
    case _SIGFPE
    case _SIGPIPE
    case _unknown
    
    public init(code: Int32) {
      
      switch code {
      case EXC_BREAKPOINT: self = ._EXC_BREAKPOINT
      case EXC_CRASH: self = ._EXC_CRASH
      case EXC_BAD_ACCESS: self = ._EXC_BAD_ACCESS
      case EXC_BAD_INSTRUCTION: self = ._EXC_BAD_INSTRUCTION
      case SIGINT: self = ._SIGINT
      case SIGABRT: self = ._SIGABRT
      case SIGKILL: self = ._SIGKILL
      case SIGTRAP: self = ._SIGTRAP
      case SIGBUS: self = ._SIGBUS
      case SIGSEGV: self = ._SIGSEGV
      case SIGHUP: self = ._SIGHUP
      case SIGTERM: self = ._SIGTERM
      case SIGILL: self = ._SIGILL
      case SIGFPE: self = ._SIGFPE
      case SIGPIPE: self = ._SIGPIPE
      default:
        self = ._unknown
      }
    }
    
    public var code: Int32 {
      
      switch self {
        
      case ._EXC_BREAKPOINT: return EXC_BREAKPOINT
      case ._EXC_CRASH: return EXC_CRASH
      case ._EXC_BAD_ACCESS: return EXC_BAD_ACCESS
      case ._EXC_BAD_INSTRUCTION: return EXC_BAD_INSTRUCTION
      case ._SIGINT: return SIGINT
      case ._SIGABRT: return SIGABRT
      case ._SIGKILL: return SIGKILL
      case ._SIGTRAP: return SIGTRAP
      case ._SIGBUS: return SIGBUS
      case ._SIGSEGV: return SIGSEGV
      case ._SIGHUP: return SIGHUP
      case ._SIGTERM: return SIGTERM
      case ._SIGILL: return SIGILL
      case ._SIGFPE: return SIGFPE
      case ._SIGPIPE: return SIGPIPE
      case ._unknown: return -1
      }
    }
    
    public var title: String {
      
      switch self {
        
      case ._EXC_BREAKPOINT: return "EXC_BREAKPOINT"
      case ._EXC_CRASH: return "EXC_CRASH"
      case ._EXC_BAD_ACCESS: return "EXC_BAD_ACCESS"
      case ._EXC_BAD_INSTRUCTION: return "EXC_BAD_INSTRUCTION"
      case ._SIGINT: return "SIGINT"
      case ._SIGABRT: return "SIGABRT"
      case ._SIGKILL: return "SIGKILL"
      case ._SIGTRAP: return "SIGTRAP"
      case ._SIGBUS: return "SIGBUS"
      case ._SIGSEGV: return "SIGSEGV"
      case ._SIGHUP: return "SIGHUP"
      case ._SIGTERM: return "SIGTERM"
      case ._SIGILL: return "SIGILL"
      case ._SIGFPE: return "SIGFPE"
      case ._SIGPIPE: return "SIGPIPE"
      case ._unknown: return "unknown"
      }
    }
    
    public func description() -> String {
      
      let stackTrace = "signal \(title)"
      return stackTrace
    }
  }
  
  public func register() {
    
    Signal
      .allCases
      .forEach { scode in
        
        signal(scode.code) {
          
          ApplicationSignalEventHander.handle(event: $0)
        }
      }
  }
  
  public static func handle(event: Any?) {
    
    guard let event = event,
          let eventObj = event as? Int32 else { return }
    
    let signalObj = Signal(code: eventObj)
    
    ProcessNotification
      .post(
        name: ApplicationSignalEventHander.notification,
        obj: signalObj)
  }
}
