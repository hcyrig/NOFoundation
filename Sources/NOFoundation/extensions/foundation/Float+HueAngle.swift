//
//  Float+HueAngle.swift
//  NOFoundation
//
//  Copyright © 2022 Kostiantyn Girych a.k.a "hcyrig". All rights reserved.
//

import Foundation

extension Float {
  
  public func hueAngleOffset(_ offset: Float) -> Float {
    (self * 360 + offset) / 360
  }
}
