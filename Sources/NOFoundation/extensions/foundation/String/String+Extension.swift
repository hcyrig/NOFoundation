//
//  String+Extension.swift
//  NOFoundation
//
//  Copyright © 2022 Kostiantyn Girych a.k.a "hcyrig". All rights reserved.
//

import Foundation

public extension String {
  
  static var empty: String { return "" }
  
  static var zero: String { return "0" }
  
  static var spacebar: String { return " " }
  
  static var carriageReturn: String { return "\r" }
  
  static var lineFeed: String { return "\n" }
  
  var firstCapitalizer: String {
    .init(prefix(1).capitalized + dropFirst())
  }
}
