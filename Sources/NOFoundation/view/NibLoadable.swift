//
//  NibLoadable.swift
//  NOFoundation
//
//  Copyright © 2022 Kostiantyn Girych a.k.a "hcyrig". All rights reserved.
//

import AppKit

public protocol NibLoadable {
  
  static var nibName: String { get }
  
  static func createFromNib(in bundle: Bundle) -> Self
  static func makeIn(_ container: NSView) -> Self
}

public extension NibLoadable where Self: NSView {
  
  static var nibName: String {
    return String(describing: Self.self)
  }
  
  static func createFromNib(in bundle: Bundle = Bundle.main) -> Self {
    var topLevelArray: NSArray? = nil
    bundle.loadNibNamed(NSNib.Name(nibName), owner: self, topLevelObjects: &topLevelArray)
    let views = Array<Any>(topLevelArray!).filter { $0 is Self }
    return views.last as! Self
  }
  
  @discardableResult
  static func makeIn(_ container: NSView) -> Self {
    
    let bundle = Bundle(for: Self.self)
    let view = Self.createFromNib(in: bundle)
    container.bindSubview(view)
    return view
  }
}
