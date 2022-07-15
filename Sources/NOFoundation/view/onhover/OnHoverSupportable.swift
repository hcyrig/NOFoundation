//
//  OnHoverSupportable.swift
//  NOFoundation
//
//  Copyright © 2022 Kostiantyn Girych a.k.a "hcyrig". All rights reserved.
//

import AppKit

protocol OnHoverSupportable: AnyObject {
  
  var isOnHover: Bool { get set }
  var trackingArea: NSTrackingArea! { get set }
  var onHoverColor: NSColor { get set }
  
  func updateTrackingArea()
  func resetTrackingArea()
  func resetMousePosition()
  
  func makeTrackingArea() -> NSTrackingArea
}

extension OnHoverSupportable where Self: NSView {
 
  func updateTrackingArea() {
    
    removeTrackingArea(trackingArea)
    
    resetTrackingArea()
    
    resetMousePosition()
    
    addTrackingArea(trackingArea)
  }
  
  func resetTrackingArea() {
    
    trackingArea = makeTrackingArea()
  }
  
  func makeTrackingArea() -> NSTrackingArea {
    .init(rect: bounds,
          options: [.mouseEnteredAndExited,
                    .activeAlways],
          owner: self,
          userInfo: nil)
  }
  
  func resetMousePosition() {
    
    var mouseLocation = window?.mouseLocationOutsideOfEventStream
    mouseLocation = convert(mouseLocation ?? .zero, from: nil)
    
    isOnHover = bounds.contains(mouseLocation ?? .zero)
  }
}
