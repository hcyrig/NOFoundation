//
//  NOHTTPMethod.swift
//  NOFoundation
//
//  Copyright © 2022 Kostiantyn Girych a.k.a "hcyrig". All rights reserved.
//

import Foundation

public enum NOHTTPMethod {
  
  case get
  case post
  
  var title: String {
    
    switch self {
    case .get: return "get".uppercased()
    case .post: return "post".uppercased()
    }
  }
}
