//
//  NOBackgroundView.swift
//  NOFoundation
//
//  Copyright © 2022 Kostiantyn Girych a.k.a "hcyrig". All rights reserved.
//

import AppKit

@objc
open class NOBackgroundView: NSView {
  
  @IBInspectable public var lightColor: NSColor = .white
  @IBInspectable public var darkColor: NSColor = .black
  
  @IBInspectable public var borderLightColor: NSColor = .clear
  @IBInspectable public var borderDarkColor: NSColor = .clear
  
  @IBInspectable public var borderWidht: CGFloat = 1.0
  
  // invocation when application changes its appearance
  open override func viewDidChangeEffectiveAppearance() { needsDisplay = true }
  //
  
  @objc
  public override init(frame frameRect: NSRect) {
    super.init(frame: frameRect)
    
    wantsLayer = true
  }
  
  @objc
  required public init?(coder: NSCoder) {
    super.init(coder: coder)
    
    wantsLayer = true
  }
  
  @objc
  open override func updateLayer() { 
    super.updateLayer()
    
    layer?.backgroundColor = isDarkMode
      ? darkColor.cgColor
      : lightColor.cgColor
    
    layer?.borderWidth = borderWidht
    layer?.borderColor = isDarkMode
      ? borderDarkColor.cgColor
      : borderLightColor.cgColor
  }
}
