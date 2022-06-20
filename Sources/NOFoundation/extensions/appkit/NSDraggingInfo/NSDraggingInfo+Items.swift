//
//  NSDraggingInfo+Items.swift
//  NOFoundation
//
//  Copyright © 2022 Kostiantyn Girych a.k.a "hcyrig". All rights reserved.
//

import AppKit

extension NSDraggingInfo {
  
  public func draggedItems<T>() -> [T]? {
    
    if !(T.self is AnyClass) { return nil }
    
    guard let items = draggingPasteboard.readObjects(
      forClasses: [T.self as! AnyClass],
      options: nil) as? [T] else {
        return nil
      }
    return items
  }
}
