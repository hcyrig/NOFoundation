//
//  DEBUGLogger.swift
//  NOFoundation
//
//  Copyright © 2022 Kostiantyn Girych a.k.a "hcyrig". All rights reserved.
//

import Foundation

public struct DEBUGLogger {
  
  public static func log(_ objs: Any...) {
#if DEBUG
    objs.forEach(log)
#endif
  }
  
  public static func log(_ obj: Any) {
    
#if DEBUG
    Swift.print(obj)
#endif
  }
}
