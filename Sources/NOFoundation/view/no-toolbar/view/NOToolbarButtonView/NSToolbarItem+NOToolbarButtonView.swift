//
//  NSToolbarItem+NOToolbarButtonView.swift
//  NOFoundation
//
//  Copyright © 2022 Kostiantyn Girych a.k.a "hcyrig". All rights reserved.
//

import AppKit

public extension NSToolbarItem {
  
  static func toolbarButtonItem(identifier: Identifier,
                                info: NOToolbarButtonView.Info,
                                target: AnyObject?,
                                action: Selector?) -> NSToolbarItem {
    
    let toolbarItem = NSToolbarItem(itemIdentifier: identifier)
    
    toolbarItem.label = info.label
    toolbarItem.paletteLabel = info.paletteLabel
    toolbarItem.toolTip = info.toolTip
    
    let view = NOToolbarButtonView(info: info,
                                   identifier: identifier.rawValue,
                                   target: target,
                                   action: action)
    toolbarItem.view = view
    
    toolbarItem.isBordered = false
    
    return toolbarItem
  }
  
  static func sidebarButtonItem(identifier: Identifier,
                                info: NOToolbarButtonView.Info,
                                target: AnyObject?,
                                action: Selector?) -> NSToolbarItem {
    
    let toolbarItem = NSToolbarItem(itemIdentifier: identifier)
    
    toolbarItem.label = info.label
    toolbarItem.paletteLabel = info.paletteLabel
    toolbarItem.toolTip = info.toolTip
    
    let view = NOToolbarSlideView(info: info,
                                  identifier: identifier.rawValue,
                                  target: target,
                                  action: action)
    
    toolbarItem.view = view
    
    toolbarItem.isBordered = false
    
    return toolbarItem
  }
}
