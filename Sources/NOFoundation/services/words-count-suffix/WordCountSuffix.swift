//
//  WordCountSuffix.swift
//  NOFoundation
//
//  Copyright © 2022 Kostiantyn Girych a.k.a "hcyrig". All rights reserved.
//

import Foundation

public protocol WordCountSuffix {
  
  var wordCountSuffix: String { get }
  
  func wordCountSuffix(_ number: Int) -> String
}

public extension WordCountSuffix {
  
  func wordCountSuffix(_ number: Int) -> String {
    number == 1 ? "" : "s"
  }
}

extension Float: WordCountSuffix {
  public var wordCountSuffix: String { wordCountSuffix(Int(self)) }
}

extension Int: WordCountSuffix {
  public var wordCountSuffix: String { wordCountSuffix(self) }
}
