//
//  NOTransparentScroller.swift
//  NOFoundation
//
//  Copyright © 2022 Kostiantyn Girych a.k.a "hcyrig". All rights reserved.
//

import AppKit

open class NOTransparentScroller: NSScroller {
  
  open override func draw(_ dirtyRect: NSRect) {
    
    self.drawKnob()
  }
}
