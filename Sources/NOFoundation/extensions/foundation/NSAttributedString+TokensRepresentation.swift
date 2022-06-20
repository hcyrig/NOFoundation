//
//  NSAttributedString+TokensRepresentation.swift
//  NOFoundation
//
//  Copyright © 2022 Kostiantyn Girych a.k.a "hcyrig". All rights reserved.
//

import AppKit

public extension NSAttributedString {
  
  static func tokenizedAttributedString(sourceString: String,
                                        tokens: TokensRepresentation,
                                        color: NSColor) -> NSAttributedString {
    
    if tokens.isEmpty { return .init(string: sourceString) }
    
    let destinationString = NSMutableAttributedString(string: sourceString)
    tokens.forEach {
      
      destinationString
        .addAttributes(
          [NSAttributedString.Key.underlineStyle : 1,
           NSAttributedString.Key.underlineColor : color
          ],
          range: $0.range)
    }
    
    return .init(attributedString: destinationString)
  }
}
