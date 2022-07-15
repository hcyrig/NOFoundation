//
//  NonInteractableTextField.swift
//  NOFoundation
//
//  Copyright © 2022 Kostiantyn Girych a.k.a "hcyrig". All rights reserved.
//

import AppKit

open class NonInteractableTextField: NSTextField {
  
  override init(frame frameRect: NSRect) {
    super.init(frame: frameRect)
  }
  
  required public init?(coder: NSCoder) {
    super.init(coder: coder)
  }
  
  override open func hitTest(_ point: NSPoint) -> NSView? {
    return nil
  }
}
