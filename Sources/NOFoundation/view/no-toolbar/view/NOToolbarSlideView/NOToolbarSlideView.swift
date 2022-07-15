//
//  NOFoundationSlideView.swift
//  NOFoundation
//
//  Copyright © 2022 Kostiantyn Girych a.k.a "hcyrig". All rights reserved.
//

import AppKit

open class NOToolbarSlideView: NSButton {
  
  public struct ContentSize {
    
    var widthSize: CGFloat = 37.0
    var heightSize: CGFloat = 26.0
    var cornerRadius: CGFloat = 6.0
  }
  
  public override var isFlipped: Bool { true }
  
  var contentSize = ContentSize()
  
  public var itemIdentifier: String = .empty
  
  required public init?(coder: NSCoder) {
    super.init(coder: coder)
  }
  
  public override func awakeFromNib() {
    super.awakeFromNib()
    
    prepareLayers()
  }
  
  override init(frame frameRect: NSRect) {
    super.init(frame: frameRect)
    
    prepareLayers()
  }
  
  func prepareLayers() {
    
    wantsLayer = true
    layer?.cornerRadius = contentSize.cornerRadius
    
    setButtonType(.momentaryChange)
    bezelStyle = .texturedRounded
    imagePosition = .imageOnly
    imageScaling = .scaleProportionallyDown
    title = .empty
    isBordered = true
    
    addSizeConstraints()
  }
  
  private func addSizeConstraints() {
    
    constraints.forEach({ self.removeConstraint($0) })
    
    let heightC: NSLayoutConstraint = .init(
      item: self,
      attribute: .height,
      relatedBy: .equal,
      toItem: nil,
      attribute: .height,
      multiplier: 1.0,
      constant: contentSize.heightSize)
    
    let widhtC: NSLayoutConstraint = .init(
      item: self,
      attribute: .width,
      relatedBy: .equal,
      toItem: nil,
      attribute: .width,
      multiplier: 1.0,
      constant: contentSize.widthSize)
    
    addConstraint(heightC)
    addConstraint(widhtC)
  }
}

extension NOToolbarSlideView {
  
  convenience init(info: NOToolbarButtonView.Info,
                   identifier: String,
                   target: AnyObject?,
                   action: Selector?) {
    self.init()
    
    itemIdentifier = identifier
    
    image = NSImage(systemSymbolName: info.imageName,
                    accessibilityDescription: info.label)
    
    toolTip = info.toolTip
    
    self.action = action
    self.target = target
  }
}
