//
//  NSImage+PNG.swift
//  NOFoundation
//
//  Copyright © 2022 Kostiantyn Girych a.k.a "hcyrig". All rights reserved.
//

import AppKit

extension NSImage {
  
  public var jpgData: Data? {
    imageData(type: .jpeg)
  }
  
  public var pngData: Data? {
    imageData(type: .png)
  }
  
  public func imageData(type: NSBitmapImageRep.FileType) -> Data? {
    
    guard let tiffRepresentation = tiffRepresentation, let bitmapImage = NSBitmapImageRep(data: tiffRepresentation) else { return nil }
    return bitmapImage.representation(using: type, properties: [:])
  }
  
  static public func dataWrite(data: Data?,
                               to url: URL,
                               options: Data.WritingOptions = .atomic) -> Bool {
    
    do {
      
      try data?.write(to: url, options: options)
      return true
      
    } catch {
      
      DEBUGLogger.log(error)
      return false
    }
  }
}
