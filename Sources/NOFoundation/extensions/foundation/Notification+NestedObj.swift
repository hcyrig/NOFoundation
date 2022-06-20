//
//  Notification+NestedObj.swift
//  NOFoundation
//
//  Copyright © 2022 Kostiantyn Girych a.k.a "hcyrig". All rights reserved.
//

import Foundation

public extension Notification {
  
  func nestedOjb<T>() -> T? { userInfo?[name] as? T }
}
