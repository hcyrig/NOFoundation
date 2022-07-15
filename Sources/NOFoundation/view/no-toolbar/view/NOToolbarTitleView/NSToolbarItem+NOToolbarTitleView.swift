//
//  NSToolbarItem+NOToolbarTitleView.swift
//  NOFoundation
//
//  Copyright © 2022 Kostiantyn Girych a.k.a "hcyrig". All rights reserved.
//

import AppKit

public extension NSToolbarItem {
  
  static func toolbarTitleItem(identifier: Identifier,
                               info: NOToolbarButtonView.Info) -> NSToolbarItem {
    
    let toolbarItem = NSToolbarItem(itemIdentifier: identifier)
    
    toolbarItem.label = info.label
    toolbarItem.paletteLabel = info.paletteLabel
    toolbarItem.toolTip = info.toolTip
    
    toolbarItem.view = NOToolbarTitleView(info: .init(title: .empty,
                                                      subTitle: .empty))
    
    toolbarItem.isBordered = false
    
    toolbarItem.isEnabled = false
    
    return toolbarItem
  }
}
