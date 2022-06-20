//
//  String+DigitIncrement.swift
//  NOFoundation
//
//  Copyright © 2022 Kostiantyn Girych a.k.a "hcyrig". All rights reserved.
//

import Foundation

public extension String {
  
  var incrementOrOne: String {
    .init((Int(self) ?? 1) + 1)
  }
}
