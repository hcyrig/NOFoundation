//
//  NSViewController+Childs.swift
//  NOFoundation
//
//  Copyright © 2022 Kostiantyn Girych a.k.a "hcyrig". All rights reserved.
//

import AppKit

public extension NSViewController {
  
  func bindChild(_ viewContller: NSViewController) {
    
    addChild(viewContller)
    view.bindSubview(viewContller.view)
  }
  
  func unbindChild(_ viewController: NSViewController) {
    
    viewController.view.removeFromSuperview()
    viewController.removeFromParent()
  }
}
