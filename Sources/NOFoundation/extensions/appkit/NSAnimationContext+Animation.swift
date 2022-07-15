//
//  NSAnimationContext+Animation.swift
//  NOFoundation
//
//  Copyright © 2022 Kostiantyn Girych a.k.a "hcyrig". All rights reserved.
//

import AppKit

public extension NSAnimationContext {
  
  static let animationDuration: TimeInterval = .zero
  
  static func defaultAnimation(duration: TimeInterval = animationDuration,
                               isImplicitAnimation: Bool = false,
                               _ animation: @escaping VoidCallback,
                               completionHandler: VoidCallback? = nil) {
    
    NSAnimationContext.runAnimationGroup({ context in
      
      context.duration = duration
      context.allowsImplicitAnimation = isImplicitAnimation
      
      animation()
      
    }, completionHandler: completionHandler)
  }
}
