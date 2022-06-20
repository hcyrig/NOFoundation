//
//  URL+NOHTTPURL.swift
//  NOFoundation
//
//  Copyright © 2022 Kostiantyn Girych a.k.a "hcyrig". All rights reserved.
//

import Foundation

public extension URL {
  
  static func url(urlContent: NOHTTPURL) -> URL? {
    
    guard var url = URL(string: urlContent.host) else { return nil }
    
    if let slag = urlContent.slag,
       slag.isEmpty == false {
      url = url.appendingPathComponent(slag)
    }
    
    return url
  }
}
