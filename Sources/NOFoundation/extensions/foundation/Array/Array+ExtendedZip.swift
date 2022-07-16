//
//  Array+ExtendedZip.swift
//  NOFoundation
//
//  Copyright © 2022 Kostiantyn Girych a.k.a "hcyrig". All rights reserved.
//

import Foundation

public extension Sequence where Element: Hashable {
  
  static func shuffled(
    _ seq1: [Element],
    _ seq2: [Element],
    _ seq3: [Element]) -> [Element] {
      
      zip3(seq1, seq2, seq3)
    }
  
  static func shuffled(
    _ seq1: [Element],
    _ seq2: [Element]) -> [Element] {
      
      zip2(seq1, seq2)
    }
  
  static func zip3(
    _ seq1: [Element],
    _ seq2: [Element],
    _ seq3: [Element]) -> [Element] {
      
      var result: [Element] = []
      
      var seq1Iterator = seq1.makeIterator()
      var seq2Iterator = seq2.makeIterator()
      var seq3Iterator = seq3.makeIterator()
      
      var isItemExists = true
      
      while isItemExists {
        isItemExists = false
        
        if let item1 = seq1Iterator.next() {
          result.append(item1)
          isItemExists = true
        }
        
        if let item2 = seq2Iterator.next() {
          result.append(item2)
          isItemExists = true
        }
        
        if let item3 = seq3Iterator.next() {
          result.append(item3)
          isItemExists = true
        }
      }
      
      return result
    }
  
  static func zip2(
    _ seq1: [Element],
    _ seq2: [Element]) -> ([Element]) {
      
      var result: [Element] = []
      
      var seq1Iterator = seq1.makeIterator()
      var seq2Iterator = seq2.makeIterator()
      
      var isItemExists = true
      
      while isItemExists {
        isItemExists = false
        
        if let item1 = seq1Iterator.next() {
          result.append(item1)
          isItemExists = true
        }
        
        if let item2 = seq2Iterator.next() {
          result.append(item2)
          isItemExists = true
        }
      }
      
      return result
    }
  
  static func tail(
    _ seq1: [Element],
    _ seq2: [Element]) -> [Element] {
      
      if seq2.count >= seq1.count {
        return .init(seq2.suffix(abs(seq2.count - seq1.count)))
      } else {
        return .init(seq1.suffix(abs(seq1.count - seq2.count)))
      }
    }
  
  func tail(
    _ seq: [Element]) -> [Element] {
      
      .tail(self as! [Self.Element], seq)
    }
  
  static func compare<T: Numeric>(
    _ num1: T,
    _ num2: T,
    _ num3: T) -> Bool {
      
      return (num1, num2) == (num2, num3)
    }
}
