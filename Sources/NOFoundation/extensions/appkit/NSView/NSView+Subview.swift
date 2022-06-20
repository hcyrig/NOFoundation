//
//  NSView+Subview.swift
//  NOFoundation
//
//  Copyright © 2022 Kostiantyn Girych a.k.a "hcyrig". All rights reserved.
//

import AppKit

public extension NSView {
  
  func hasSubview(_ view: NSView) -> Bool {
    subviews.contains(view)
  }
}
