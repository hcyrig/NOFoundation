//
//  NOHTTPHeader.swift
//  NOFoundation
//
//  Copyright © 2022 Kostiantyn Girych a.k.a "hcyrig". All rights reserved.
//

import Foundation

public typealias NOHTTPHeaders = [String: String]

public enum NOHTTPHeader: String {
  
  case authorization = "Authorization"
  
  case xratelimitlimit = "x-ratelimit-limit"
  case xratelimitremainig = "x-ratelimit-remaining"
  case xratelimitreset = "x-ratelimit-reset"
}
