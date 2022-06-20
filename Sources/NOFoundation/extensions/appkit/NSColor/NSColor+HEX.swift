//
//  NSColor+HEX.swift
//  NOFoundation
//
//  Copyright © 2022 Kostiantyn Girych a.k.a "hcyrig". All rights reserved.
//

import AppKit

extension NSColor {
  
  public enum HexPrefix: String {
    
    case hexDigit = "0x"
    case hexString = "#"
    
    func dropPrefixFor(_ string: String) -> String {
      if !string.hasPrefix(self.rawValue) {
        return .init(string)
      }
      return .init(string.dropFirst(self.rawValue.count))
    }
  }
  
  public static func colorFromHex(_ hex: UInt64,
                                  alpha: Float,
                                  colorSpace: NSColorSpace = .displayP3) -> NSColor {
    
    let red = CGFloat((hex & 0xFF0000) >> 16) / 255.0
    let green = CGFloat((hex & 0xFF00) >> 8) / 255.0
    let blue = CGFloat((hex & 0xFF) >> 0) / 255.0
    
    let color = NSColor(colorSpace: colorSpace,
                        components: [red, green, blue, CGFloat(alpha)], count: 4)
    return color
  }
  
  public static func colorFromHexString(_ hexString: String,
                                        alpha: Float,
                                        colorSpace: NSColorSpace = .displayP3) -> NSColor? {
    
    var hexString = hexString
    
    hexString = HexPrefix.hexDigit.dropPrefixFor(hexString)
    hexString = HexPrefix.hexString.dropPrefixFor(hexString)
    
    let hexPattern = "[a-fA-F0-9]+"
    if !hexString.matches(with: hexPattern) { return nil }
    
    var hex: UInt64 = 0
    let scanner = Scanner(string: hexString)
    scanner.scanHexInt64(&hex)
    return colorFromHex(hex, alpha: alpha, colorSpace: colorSpace)
  }
  
  public func toHexString(prefix: HexPrefix = .hexString) -> String {
    NSColor.colorToHexString(self, prefix: prefix)
  }
  
  public static func colorToHexString(_ color: NSColor, prefix: HexPrefix) -> String {
    
    hexToString(colorToHex(color), prefix: prefix)
  }
  
  public static func colorToHex(_ color: NSColor) -> UInt64 {
    
    let color = color.customColorSpace()
    
    let red = color!.redComponent * 255.0
    let green = color!.greenComponent * 255.0
    let blue = color!.blueComponent * 255.0
    
    var hex: UInt64 = 0
    hex = (UInt64(red) << 16 | hex)
    hex = (UInt64(green) << 8 | hex)
    hex = (UInt64(blue) << 0 | hex)
    return hex
  }
  
  public static func hexToString(_ hex: UInt64, prefix: HexPrefix) -> String {
    
    let hexDigit = String(format:"%06X", hex)
    return "\(prefix.rawValue)\(hexDigit)"
  }
}
