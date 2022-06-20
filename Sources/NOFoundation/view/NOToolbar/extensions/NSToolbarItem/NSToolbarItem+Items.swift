//
//  NSToolbarItem+Items.swift
//  NOToolbar
//
//  Copyright © 2022 Kostiantyn Girych a.k.a "hcyrig". All rights reserved.
//

import AppKit

public extension NSToolbarItem {
  
  static func item(
    by menuItem: NSMenuItem,
    toolbar: NSToolbar?) -> [NSToolbarItem]? {
      
      toolbar?
        .items(by: menuItem)
    }
}

public extension NSToolbarItem.Identifier {
  
  static func identifierBy(
    menuItem: NSMenuItem,
    toolbar: NSToolbar?) -> [NSToolbarItem.Identifier]? {
      
      toolbar?
        .itemsIdentifier(by: menuItem)
    }
}
