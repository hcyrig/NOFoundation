//
//  NSView+RemoveSubviews.swift
//  NOFoundation
//
//  Copyright © 2022 Kostiantyn Girych a.k.a "hcyrig". All rights reserved.
//

import AppKit

public extension NSView {
  
  func removeSubViewsBy<T>(for type: T.Type) where T: NSView {
    
    NSView.removeSubViewsBy(view: self,
                            for: type)
  }
  
  static func removeSubViewsBy<T>(view: NSView?,
                           for type: T.Type) where T: NSView {
    
    view?.subviews.forEach({
      
      guard let view = $0 as? T else { return }
      view.removeFromSuperview()
    })
  }
}
