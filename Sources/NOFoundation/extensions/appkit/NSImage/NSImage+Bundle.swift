//
//  NSImage+Bundle.swift
//  NOFoundation
//
//  Copyright © 2022 Kostiantyn Girych a.k.a "hcyrig". All rights reserved.
//

import AppKit

public extension NSImage {
  
  static func image(
    for bundle: Bundle,
    and name: NSImage.Name) -> NSImage? {
      
      bundle.image(forResource: name)
    }
}
