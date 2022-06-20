//
//  NSToolbar+Identifier.swift
//  NOToolbar
//
//  Copyright © 2022 Kostiantyn Girych a.k.a "hcyrig". All rights reserved.
//

import AppKit

public extension NSToolbar {
  
  func itemsIdentifier(by menuItem: NSMenuItem) -> [NSToolbarItem.Identifier]? {
    
    items(by: menuItem)?
      .compactMap({ $0.itemIdentifier })
  }
}
