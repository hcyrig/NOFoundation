//
//  NSCIImageRep+NSImage.swift
//  NOFoundation
//
//  Copyright © 2022 Kostiantyn Girych a.k.a "hcyrig". All rights reserved.
//

import AppKit

extension NSCIImageRep {
  
  static func nsImage(ciImage: CIImage) -> NSImage? {
    
    NSCIImageRep(ciImage: ciImage)
      .nsImage(ciImage: ciImage)
  }
  
  func nsImage(ciImage: CIImage) -> NSImage? {
    let nsImage = NSImage(size: size)
    nsImage.addRepresentation(self)
    return nsImage
  }
}
