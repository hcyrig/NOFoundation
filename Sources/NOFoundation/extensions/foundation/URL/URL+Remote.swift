//
//  URL+Remote.swift
//  NOFoundation
//
//  Copyright © 2022 Kostiantyn Girych a.k.a "hcyrig". All rights reserved.
//

import Foundation

public extension URL {
  
  var isHTTPURL: Bool {
    scheme == "http" || scheme == "https"
  }
}
