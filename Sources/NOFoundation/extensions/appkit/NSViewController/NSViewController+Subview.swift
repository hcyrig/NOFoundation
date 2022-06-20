//
//  NSViewController+Subview.swift
//  NOFoundation
//
//  Copyright © 2022 Kostiantyn Girych a.k.a "hcyrig". All rights reserved.
//

import AppKit

public extension NSViewController {
  
  func moveViewToParentView() {
    
    view.isHidden = false
    
    guard let parent = parent else { return }
    guard !isParentSubview else { return }
    
    parent.view.bindSubview(view)
  }
  
  func removeViewFromParentView() {
    
    view.isHidden = true
    view.removeFromSuperview()
  }
  
  var isParentSubview: Bool {
    parent?.view.hasSubview(view) == true
  }
}
