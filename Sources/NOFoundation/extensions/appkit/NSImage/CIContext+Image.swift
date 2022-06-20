//
//  CIContext+Image.swift
//  NOFoundation
//
//  Copyright © 2022 Kostiantyn Girych a.k.a "hcyrig". All rights reserved.
//

import AppKit

public extension CIContext {
  
  convenience init?(mtlDevice: MTLDevice,
                    colorSpace: CFString = CGColorSpace.displayP3) {
    
    guard let colorSpace = CGColorSpace(name: colorSpace)
    else { return nil }
    
    self.init(mtlDevice: mtlDevice,
              options: [.workingColorSpace : colorSpace,
                        .outputColorSpace : colorSpace])
  }
  
  convenience init?(colorSpace: CFString = CGColorSpace.displayP3) {
    
    guard let colorSpace = CGColorSpace(name: colorSpace)
    else { return nil }
    
    self.init(options: [.workingColorSpace : colorSpace,
                        .outputColorSpace : colorSpace])
  }
  
  static func cgImage(ciImage: CIImage,
                      size: CGSize = .zero,
                      colorSpace: CFString = CGColorSpace.displayP3) -> CGImage? {
    
    CIContext(colorSpace: colorSpace)?
      .cgImage(ciImage: ciImage,
               size: size)
  }
  
  func cgImage(ciImage: CIImage,
               size: CGSize = .zero) -> CGImage? {
    ciImage
      .cgImage(from: self)
  }
  
  static func nsImage(ciImage: CIImage,
                      size: CGSize = .zero,
                      colorSpace: CFString = CGColorSpace.displayP3) -> NSImage? {
    
    guard let cgImage = cgImage(ciImage: ciImage,
                                size: size,
                                colorSpace: colorSpace)
    else { return nil }
    
    return .init(cgImage: cgImage,
                 size: size)
  }
  
  func nsImage(ciImage: CIImage,
               size: CGSize = .zero) -> NSImage? {
    
    guard let cgImage = cgImage(ciImage: ciImage,
                                size: size)
    else { return nil }
    
    return .init(cgImage: cgImage,
                 size: size)
  }
}
