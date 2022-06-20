//
//  String+Matches.swift
//  NOFoundation
//
//  Copyright © 2022 Kostiantyn Girych a.k.a "hcyrig". All rights reserved.
//

import Foundation

extension String  {
  
  func matches(with pattern: String) -> Bool {
    NSPredicate(format:"SELF MATCHES %@",
                pattern)
      .evaluate(with: self)
  }
  
  func like(_ pattern: String) -> Bool {
    NSPredicate(format: "SELF LIKE[cd] %@", "*" + pattern + "*")
      .evaluate(with: self)
  }
}
