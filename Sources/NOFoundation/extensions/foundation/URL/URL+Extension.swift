//
//  URL+Extension.swift
//  NOFoundation
//
//  Copyright © 2022 Kostiantyn Girych a.k.a "hcyrig". All rights reserved.
//

import Foundation

public extension URL {
  
  func url(params: [String: String]) -> URL? {
    
    let urlComponents = URLComponents.urlComponents(url: self,
                                                    params: params)
    return urlComponents?.url
  }
  
  static func url(url: URL,
                  params: [String: String])
  -> URL? {
    
    let urlComponents = URLComponents.urlComponents(url: url,
                                                    params: params)
    return urlComponents?.url
  }
}
