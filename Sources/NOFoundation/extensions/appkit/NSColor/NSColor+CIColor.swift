//
//  NSColor+ImageProcessing.swift
//  NOFoundation
//
//  Copyright © 2022 Kostiantyn Girych a.k.a "hcyrig". All rights reserved.
//

import AppKit

extension NSColor {
  
  public var ciColor: CIColor? {
    CIColor(color: self)
  }
}
