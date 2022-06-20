//
//  NSView+Shadow.swift
//  NOFoundation
//
//  Copyright © 2022 Kostiantyn Girych a.k.a "hcyrig". All rights reserved.
//

import AppKit

public extension NSView {
  
  func makeShadow(offset: CGSize,
                  color: NSColor,
                  radius: CGFloat,
                  opacity: Float) {
    
    wantsLayer = true
    
    layer?.shadowOffset = offset
    layer?.shadowColor = color.cgColor
    layer?.shadowRadius = radius
    layer?.shadowOpacity = opacity
  }
}
