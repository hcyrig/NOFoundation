//
//  StoryboardLoadable.swift
//  NOFoundation
//
//  Copyright © 2022 Kostiantyn Girych a.k.a "hcyrig". All rights reserved.
//

import AppKit

public protocol StoryboardLoadable {
  
  static var storyboardIdentifier: String { get }
  static func loadFromStoryboard(storyboardName: String) -> Self
}

public extension StoryboardLoadable where Self: NSViewController {
  
  static var storyboardIdentifier: String { .init(describing: Self.self) }
  
  static func loadFromStoryboard(storyboardName: String = "main") -> Self {
    
    NSStoryboard(name: storyboardName,
                 bundle: Bundle(for: Self.self))
      .instantiateController(withIdentifier: Self.storyboardIdentifier) as! Self
  }
}
