//
//  NSImage+CIImage.swift
//  NOFoundation
//
//  Copyright © 2022 Kostiantyn Girych a.k.a "hcyrig". All rights reserved.
//

import AppKit

public extension NSImage {
  
  var ciImage: CIImage? {
    
    guard let representation = tiffRepresentation,
          let ciImage = CIImage(
            data: representation,
            options: [
              .colorSpace : CGColorSpace(name: CGColorSpace.displayP3) as Any
            ]) else { return nil }
    
    return ciImage
  }
}
