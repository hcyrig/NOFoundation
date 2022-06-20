//
//  NSImage+Color.swift
//  NOFoundation
//
//  Copyright © 2022 Kostiantyn Girych a.k.a "hcyrig". All rights reserved.
//

import AppKit

extension NSImage {
  
  public static func image(from color: NSColor,
                           with size: NSSize) -> NSImage {
    
    let image = NSImage(size: size)
    image.lockFocus()
    color.drawSwatch(in: NSRect(origin: .zero,
                                size: size))
    image.unlockFocus()
    return image
  }
}

extension NSImage {
  
  public func circleWith(radius: CGFloat) -> NSImage {
    
    let colorSpace = CGColorSpace(name: CGColorSpace.displayP3)
    let rect = NSRect(origin: NSPoint.zero, size: size)
    if
      let cgImage = self.cgImage,
      let context = CGContext(
        data: nil,
        width: Int(size.width),
        height: Int(size.height),
        bitsPerComponent: 8,
        bytesPerRow: 4 * Int(size.width),
        space: colorSpace!,
        bitmapInfo: CGImageAlphaInfo.premultipliedFirst.rawValue) {
      context.beginPath()
      let circlePath = CGPath(ellipseIn: rect.insetBy(dx: rect.size.width / 2 - radius, dy: rect.size.height / 2 - radius), transform: nil)
      
      context.addPath(circlePath)
      context.closePath()
      context.clip()
      context.draw(cgImage, in: rect)
      if let composedImage = context.makeImage() {
        return NSImage(cgImage: composedImage, size: size)
      }
    }
    return self
  }
}

fileprivate extension NSImage {
  
  var cgImage: CGImage? {
    
    var rect = CGRect.init(origin: .zero, size: size)
    return cgImage(forProposedRect: &rect, context: nil, hints: nil)
  }
}

extension NSImage {
  
  public func resizedImage(scale: CGFloat = 1.0,
                    aspectRatio: CGFloat = 1.0,
                    size: CGSize = .zero) -> NSImage? {
    
      guard let ciImage = self.ciImage else { return nil }

      let filter = CIFilter(name: "CILanczosScaleTransform")
      filter?.setValue(ciImage, forKey: kCIInputImageKey)
      filter?.setValue(scale, forKey: kCIInputScaleKey)
      filter?.setValue(aspectRatio, forKey: kCIInputAspectRatioKey)
    
      return filter?.outputImage?.nsImage(size: size)
  }
  
  public static func imageFor(
    color: NSColor,
    from imageSize: NSSize = .init(width: 96,
                                  height: 96),
    to toSize: NSSize = .init(width: 32,
                              height: 32)) -> NSImage {
    
    let image = NSImage
      .image(from: color,
             with: imageSize)
      .circleWith(radius: imageSize.width / 2.0)
      .resizedImage(scale: 2.0, aspectRatio: 1.0, size: toSize)!
    return image
  }
}

extension NSImage {
  
  public func tintedNonTemplate(color: NSColor) -> NSImage {
    
    guard let image = self.copy() as? NSImage else { return self }
    
    image.lockFocus()
    color.set()
    let imageRect = NSRect(origin: NSZeroPoint, size: image.size)
    imageRect.fill(using: .sourceAtop)
    image.unlockFocus()
    
    image.isTemplate = true
    
    return image
  }
}
