//
//  Array+SafeElement.swift
//  NOFoundation
//
//  Copyright © 2022 Kostiantyn Girych a.k.a "hcyrig". All rights reserved.
//

import Foundation

public extension Array {
  
  func safeElement(by index: Int) -> Element? {
    
    if index < .zero || index >= count { return nil }
    
    return self[index]
  }
}
