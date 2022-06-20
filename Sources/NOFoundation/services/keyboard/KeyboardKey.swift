//
//  KeyboardKey.swift
//  NOFoundation
//
//  Copyright © 2022 Kostiantyn Girych a.k.a "hcyrig". All rights reserved.
//

import Foundation

public enum KeyboardKey: String {
  
  public enum Code: UInt64 {
    
    case spacebar = 49
    case delete = 0x33
  }
  
  case nextLine = "\r"
  case esc = "\u{1b}"
  case backspace = "\u{8}"
  
  func equivalent(code: Int) -> String {
    
    let array = [unichar(code)]
    return NSString(characters: array, length: 1) as String
  }
}
