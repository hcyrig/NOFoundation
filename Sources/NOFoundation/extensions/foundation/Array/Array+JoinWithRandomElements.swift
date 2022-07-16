//
//  Array+JoinWithRandomElements.swift
//  NOFoundation
//
//  Copyright © 2022 Kostiantyn Girych a.k.a "hcyrig". All rights reserved.
//

import Foundation

public extension Array where Element == String {
  
  func joined(
    separator: String,
    randPrefix: Int) -> String {
    
    var randPrefix = randPrefix
    if count <= randPrefix {
      randPrefix = count - 1
      if randPrefix < .zero { randPrefix = .zero }
    }
    
    randPrefix = Int.random(in: randPrefix..<count)
    let randCategoriesTitles = shuffled().prefix(randPrefix)
    return randCategoriesTitles.joined(separator: separator)
  }
}
