//
//  NSMenu+Items.swift
//  NOFoundation
//
//  Copyright © 2022 Kostiantyn Girych a.k.a "hcyrig". All rights reserved.
//

import AppKit

extension NSMenu {
  
  public func showMenuItem(by tag: Int) {
    changeMenuItemsVisability(by: tag,
                              shouldShow: true)
  }
  
  public func hideMenuItem(by tag: Int) {
    changeMenuItemsVisability(by: tag,
                              shouldShow: false)
  }
  
  public func changeMenuItemsVisability(by tag: Int,
                                        shouldShow: Bool) {
    menuItem(by: tag)?
      .isHidden = !shouldShow
  }
  
  public func menuItem(by tag: Int) -> NSMenuItem? {
    
    if let item = item(withTag: tag) { return item }
    
    return items.compactMap({
      
      $0.submenu?.menuItem(by: tag)
      
    }).first
  }
  
  public static func menuItem(
    from menu: NSMenu?,
    by tag: Int) -> NSMenuItem? {
      
      if let item = menu?.item(withTag: tag) { return item }
      
      return menu?.items.compactMap({
        
        menuItem(from: $0.submenu,
                 by: tag)
      }).first
    }
}
