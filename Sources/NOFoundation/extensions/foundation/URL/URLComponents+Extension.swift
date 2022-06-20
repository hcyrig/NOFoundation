//
//  URLComponents+Extension.swift
//  NOFoundation
//
//  Copyright © 2022 Kostiantyn Girych a.k.a "hcyrig". All rights reserved.
//

import Foundation

public extension URLComponents {
  
  static func urlComponents(url: URL,
                            params: [String: String])
  -> URLComponents? {
    
    guard var urlComponensts = URLComponents(
      url: url,
      resolvingAgainstBaseURL: true) else { return nil }
    
    if params.isEmpty { return urlComponensts }
      
    let items = params
      .map(URLQueryItem.init)
    urlComponensts.queryItems = items
    
    let encodedQuery = urlComponensts
      .percentEncodedQuery?
      .replacingOccurrences(of: "+", with: "%2B")
    urlComponensts.percentEncodedQuery = encodedQuery
    
    return urlComponensts
  }
}
