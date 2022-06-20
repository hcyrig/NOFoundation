//
//  NSAttributedString+LinkStyle.swift
//  NOFoundation
//
//  Copyright © 2022 Kostiantyn Girych a.k.a "hcyrig". All rights reserved.
//

import AppKit

public extension NSAttributedString {
  
  static func linkStyleFor(
    _ substring: String,
    in string: String,
    color: NSColor = NSColor.controlAccentColor) -> NSAttributedString {
      
      let titleRange = string.range(of: substring)
      let titleNSRange = titleRange?
        .nsRange(in: string)
      
      guard let range = titleNSRange else {
        return .init(string: string)
      }
      
      let destinationString = NSAttributedString
        .linkStyle(text: string,
                   range: range,
                   color: color)
      
      return destinationString
    }
  
  static func linkStyle(
    text: String,
    range: NSRange,
    color: NSColor = NSColor.controlAccentColor) -> NSAttributedString {
      
      let destinationString = NSMutableAttributedString(string: text)
      destinationString
        .addAttributes(
          [
            NSAttributedString.Key.foregroundColor
            : color.cgColor,
            
            NSAttributedString.Key.font
            : NSFont.systemFont(ofSize: 14.0,
                                weight: .semibold),
            
            NSAttributedString.Key.underlineStyle
            : 1,
            
            NSAttributedString.Key.underlineColor
            : color.cgColor
          ],
          range: range)
      
      return destinationString
    }
}

public extension NSAttributedString {
  
  static func boldStyleFor(
    _ substring: String,
    in string: String,
    color: NSColor = NSColor.labelColor) -> NSAttributedString {
      
      let titleRange = string.range(of: substring)
      let titleNSRange = titleRange?
        .nsRange(in: string)
      
      guard let range = titleNSRange else {
        return .init(string: string)
      }
      
      let destinationString = NSAttributedString
        .boldStyle(text: string,
                   range: range,
                   color: color)
      
      return destinationString
    }
  
  static func boldStyle(
    text: String,
    range: NSRange,
    color: NSColor = NSColor.controlAccentColor) -> NSAttributedString {
      
      let destinationString = NSMutableAttributedString(string: text)
      destinationString
        .addAttributes(
          [
            NSAttributedString.Key.foregroundColor
            : color.cgColor,
            
            NSAttributedString.Key.font
            : NSFont.systemFont(ofSize: 14.0,
                                weight: .semibold),
          ],
          range: range)
      
      return destinationString
    }
}
