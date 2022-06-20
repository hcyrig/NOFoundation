//
//  NSView+IsDarkMode.swift
//  NOFoundation
//
//  Copyright © 2022 Kostiantyn Girych a.k.a "hcyrig". All rights reserved.
//

import AppKit

public extension NSView {
  
  static func isDarkMode(view: NSView) -> Bool {
    view.isDarkMode
  }
  
  var isDarkMode: Bool {
    
    guard #available(OSX 10.14, *) else { return false }
    
    return self.effectiveAppearance.bestMatch(from: [.darkAqua, .aqua]) == .darkAqua
  }
}
