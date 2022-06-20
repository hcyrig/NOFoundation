//
//  Encodable+Dictionary.swift
//  NOFoundation
//
//  Copyright © 2022 Kostiantyn Girych a.k.a "hcyrig". All rights reserved.
//

import Foundation

public extension Encodable {
  
  var dictionary: [String: Any]? {
    
    guard let jsonData = try? JSONEncoder().encode(self)
    else { return nil }
    
    return (try? JSONSerialization
              .jsonObject(with: jsonData,
                          options: .allowFragments))
      .flatMap { $0 as? [String: Any] }
  }
  
  var paramDictionary: [String: String]? {
    dictionary?.mapValues({ value -> String in
      String("\(value)")
    })
  }
}
