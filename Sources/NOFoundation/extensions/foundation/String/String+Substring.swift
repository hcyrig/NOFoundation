//
//  String+Substring.swift
//  NOFoundation
//
//  Copyright © 2022 Kostiantyn Girych a.k.a "hcyrig". All rights reserved.
//

import Foundation

public extension String {
  
  func max(
    upTo: Int,
    ending: String = "...") -> String {
      
      var itemTitle = self
      if itemTitle.count > upTo {
        
        let index = itemTitle
          .index(
            itemTitle.startIndex,
            offsetBy: upTo)
        
        itemTitle = itemTitle
          .prefix(upTo: index)
          .appending(ending)
      }
      return itemTitle
    }
}
