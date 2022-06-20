//
//  NOHTTPURL.swift
//  NOFoundation
//
//  Copyright © 2022 Kostiantyn Girych a.k.a "hcyrig". All rights reserved.
//

import Foundation

public protocol NOHTTPURL {
  
  var host: String! { get }
  var slag: String? { get }
  var url: URL? { get }
}

public extension NOHTTPURL {
  
  var url: URL? { URL.url(urlContent: self) }
}
