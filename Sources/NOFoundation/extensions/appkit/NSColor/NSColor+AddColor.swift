//
//  NSColor+AddColor.swift
//  NOFoundation
//
//  Copyright © 2022 Kostiantyn Girych a.k.a "hcyrig". All rights reserved.
//

import AppKit

extension NSColor {
  
  public func addColor(_ color: NSColor?) -> NSColor {
    
    guard let color = color else { return self }
    
    var (r1, g1, b1, a1) = (CGFloat(0), CGFloat(0), CGFloat(0), CGFloat(0))
    var (r2, g2, b2, a2) = (CGFloat(0), CGFloat(0), CGFloat(0), CGFloat(0))
    
    self.getRed(&r1, green: &g1, blue: &b1, alpha: &a1)
    color.getRed(&r2, green: &g2, blue: &b2, alpha: &a2)
    
    return .init(red: min(r1 * r2, 1),
                 green: min(g1 * g2, 1),
                 blue: min(b1 * b2, 1),
                 alpha: (a1 * a2) / 2)
  }
}
