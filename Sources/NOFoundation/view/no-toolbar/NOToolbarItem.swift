//
//  NOFoundationItem.swift
//  NOFoundation
//
//  Copyright © 2022 Kostiantyn Girych a.k.a "hcyrig". All rights reserved.
//

import AppKit

public protocol NOToolbarItem {
  
  var identifier: NSToolbarItem.Identifier { get }
  
  var info: NOToolbarButtonView.Info? { get }
  
  var toolbarItem: NSToolbarItem? { get }
}
