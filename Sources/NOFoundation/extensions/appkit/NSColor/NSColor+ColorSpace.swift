//
//  NSColor+ColorSpace.swift
//  NOFoundation
//
//  Copyright © 2022 Kostiantyn Girych a.k.a "hcyrig". All rights reserved.
//

import AppKit

extension NSColor {
  
  public func customColorSpace(colorSpace: NSColorSpace = .displayP3) -> NSColor? {
    usingColorSpace(colorSpace)
  }
  
  public convenience init(customHue hue: CGFloat,
                          saturation: CGFloat,
                          brightness: CGFloat,
                          alpha: CGFloat ) {
    
    self.init(colorSpace: .displayP3,
              hue: hue,
              saturation: saturation,
              brightness: brightness,
              alpha: alpha)
  }
  
  public convenience init(customRed red: CGFloat,
                          green: CGFloat,
                          blue: CGFloat,
                          alpha: CGFloat ) {
    
    self.init(displayP3Red: red,
              green: green,
              blue: blue,
              alpha: alpha)
    }
}
