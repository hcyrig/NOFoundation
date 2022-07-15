//
//  NSToolbar+Items.swift
//  NOFoundation
//
//  Copyright © 2022 Kostiantyn Girych a.k.a "hcyrig". All rights reserved.
//

import AppKit

public extension NSToolbar {
  
  func itemsViews<T>(class: T.Type) -> [T]? {
    
    items
      .compactMap({ $0.view as? T })
  }
  
  func items<T>(filter itemIdentifier: NSToolbarItem.Identifier,
                menuItem: NSMenuItem,
                class: T.Type) -> [T]? {
    
    items(filter: itemIdentifier,
          menuItem: menuItem)?
      .compactMap({ $0 as? T })
  }
  
  func items(filter itemIdentifier: NSToolbarItem.Identifier,
             menuItem: NSMenuItem) -> [NSToolbarItem]? {
    
    items(by: menuItem)?
      .filter({ $0.itemIdentifier == itemIdentifier })
  }
  
  func itemsViews<T>(by menuItem: NSMenuItem,
                     class: T.Type) -> [T]? {
    
    items(by: menuItem)?
      .compactMap({ $0.view as? T })
  }
  
  func items(by menuItem: NSMenuItem) -> [NSToolbarItem]? {
    
    items
      .filter({ $0.menuFormRepresentation == menuItem })
  }
  
  func itemsViews<T>(by identifier: NSToolbarItem.Identifier,
                     class: T.Type) -> [T]? {
    
    items
      .filter({ $0.itemIdentifier == identifier})
      .compactMap({ $0.view as? T })
  }
  
  func items(by identifier: NSToolbarItem.Identifier) -> [NSToolbarItem]? {
    
    items
      .filter({ $0.itemIdentifier == identifier})
  }
}
