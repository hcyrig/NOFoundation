//
//  String+SizeByFont.swift
//  NOFoundation
//
//  Copyright © 2022 Kostiantyn Girych a.k.a "hcyrig". All rights reserved.
//

import AppKit

public extension String {
  
  func sizeOfString(usingFont font: NSFont) -> NSSize {
    
    let fontAttributes = [NSAttributedString.Key.font: font]
    return self.size(withAttributes: fontAttributes)
  }
}
