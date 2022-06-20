//
//  NOHTTPResponse.swift
//  NOFoundation
//
//  Copyright © 2022 Kostiantyn Girych a.k.a "hcyrig". All rights reserved.
//

import Foundation

public typealias NOHTTPResponseClosure = (NOHTTPResponse) -> Void

public enum NOHTTPResponse {
  
  case success(data: Data, response: HTTPURLResponse)
  case failure(error: Error, response: HTTPURLResponse?)
}
