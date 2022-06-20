//
//  NOScroller.swift
//  NOFoundation
//
//  Copyright © 2022 Kostiantyn Girych a.k.a "hcyrig". All rights reserved.
//

import AppKit

open class NOScroller: NSScroller {
  
  open override func draw(_ dirtyRect: NSRect) {
    
    self.drawKnob()
  }
}
