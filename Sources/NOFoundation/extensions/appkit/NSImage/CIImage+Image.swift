//
//  CIImage+NSCGImage.swift
//  NOFoundation
//
//  Copyright © 2022 Kostiantyn Girych a.k.a "hcyrig". All rights reserved.
//

import AppKit

extension CIImage {
  
  public var nsImage: NSImage? {
    CIContext.nsImage(ciImage: self)
  }
  
  public var cgImage: CGImage? {
    CIContext.cgImage(ciImage: self)
  }
  
  public func nsImage(size: CGSize) -> NSImage? {
    CIContext.nsImage(ciImage: self, size: size)
  }
  
  public func nsImage(from context: CIContext) -> NSImage? {
    context.nsImage(ciImage: self)
  }
  
  public func cgImage(from context: CIContext) -> CGImage? {
    context.createCGImage(self, from: extent)
  }
}
