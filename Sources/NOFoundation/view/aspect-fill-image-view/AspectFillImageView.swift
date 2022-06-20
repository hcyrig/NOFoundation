//
//  AspectFillImageView.swift
//  NOFoundation
//
//  Copyright © 2022 Kostiantyn Girych a.k.a "hcyrig". All rights reserved.
//

import AppKit

open class AspectFillImageView: NSImageView {
  
  public var gravity: CALayerContentsGravity
  
  public init(gravity: CALayerContentsGravity) {
    
    self.gravity = gravity
    
    super.init(frame: .zero)
  }
  
  required public init?(coder: NSCoder) {
    self.gravity = .resizeAspectFill
    
    super.init(coder: coder)
  }
  
  public override var image: NSImage? {
    
    set {
      
      self.layer = CALayer()
      self.layer?.contentsGravity = gravity
      self.layer?.contents = newValue
      
      self.withLayer()
      
      super.image = newValue
    }
    
    get { super.image }
  }
  
  @discardableResult
  func withLayer() -> Self {
    
    wantsLayer = true
    return self
  }
}
