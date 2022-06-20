//
//  CIColor+NSColor.swift
//  NOFoundation
//
//  Copyright © 2022 Kostiantyn Girych a.k.a "hcyrig". All rights reserved.
//

import AppKit

extension CIColor {
  
  public var nsColor: NSColor {
    .init(ciColor: self)
  }
  
  public static var filterGrayColor: CIColor {
    .init(red: 0.80, green: 0.80, blue: 0.80, alpha: 0.8)
  }
}
