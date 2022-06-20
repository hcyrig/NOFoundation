//
//  NSShadow+Init.swift
//  NOFoundation
//
//  Copyright © 2022 Kostiantyn Girych a.k.a "hcyrig". All rights reserved.
//

import AppKit

public extension NSShadow {
  
  static func make(with blurRadius: CGFloat,
                   offset: CGSize,
                   color: NSColor) -> NSShadow {
    
    let shadow: NSShadow = NSShadow()
    shadow.shadowBlurRadius = blurRadius
    shadow.shadowOffset = offset
    shadow.shadowColor = color
    return shadow
  }
}
