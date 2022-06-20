//
//  Bundle+ApplicationInfo.swift
//  NOFoundation
//
//  Copyright © 2022 Kostiantyn Girych a.k.a "hcyrig". All rights reserved.
//

import Foundation

public extension Bundle {
  
  static var applicationShortVersion: String {
    Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String
  }
  static var applicationTitle: String {
    Bundle.main.infoDictionary!["CFBundleName"] as! String
  }
}
