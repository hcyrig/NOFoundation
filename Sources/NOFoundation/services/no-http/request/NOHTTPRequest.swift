//
//  NOHTTPRequest.swift
//  NOFoundation
//
//  Copyright © 2022 Kostiantyn Girych a.k.a "hcyrig". All rights reserved.
//

import Foundation

public protocol NOHTTPRequest {
  
  var url: NOHTTPURL? { get }

  var params: NOHTTPParams? { get }
  
  var method: NOHTTPMethod { get }
  
  var headers: NOHTTPHeaders? { get }
  
  var body: Data? { get }
  
  var request: URLRequest? { get }
}

public extension NOHTTPRequest {
  
  var params: NOHTTPParams? { nil }
  var headers: NOHTTPHeaders? { nil }
  var body: Data? { nil }
  
  var request: URLRequest? {
    
    guard var url = url?.url else { return nil }
    
    if let params = params {
      url = URL.url(url: url, params: params) ?? url
    }
    
    var request = URLRequest(url: url)
    
    request.httpMethod = method.title
    request.allHTTPHeaderFields = headers
    request.httpBody = body
    //request.cachePolicy = .returnCacheDataElseLoad
    
    return request
  }
}
