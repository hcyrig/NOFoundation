//
//  NOFoundation.swift
//  NOFoundation
//
//  Copyright © 2022 Kostiantyn Girych a.k.a "hcyrig". All rights reserved.
//

import AppKit

public typealias NOToolbarMenuItemHandler = (NSToolbar, NSMenuItem) -> Void

extension NSToolbar.Identifier {
  
  static let main = NSToolbar.Identifier("main.notoolbar")
}

open class NOToolbar: NSToolbar {
  
  @discardableResult
  public static func bind(to window: NSWindow,
                          noToolbarItems: [NOToolbarItem]) -> NOToolbar {
    
    let toolbar = NOToolbar(identifier: .main,
                            noToolbarItems: noToolbarItems)
    toolbar.prepare(for: window)
    window.toolbar = toolbar
    
    toolbar.removeVisualArtifactsOverToolbar(on: window)
    
    return toolbar
  }
  
  public var menuItemCallback: NOToolbarMenuItemHandler?
  public let noToolbarItems: [NOToolbarItem]
  
  public init(identifier: NSToolbar.Identifier,
                       noToolbarItems: [NOToolbarItem]) {
    self.noToolbarItems = noToolbarItems
    
    super.init(identifier: identifier)
    
    configure()
  }
  
  private func configure() {
    
    delegate = self
    allowsUserCustomization = true
    autosavesConfiguration = true
    displayMode = .iconOnly
  }
  
  public func prepare(for window: NSWindow) {
    
    window.toolbarStyle = .unified
    window.titleVisibility = .hidden
    window.toolbar?.validateVisibleItems()
  }
}

// MARK: - NSToolbarDelegate -
extension NOToolbar: NSToolbarDelegate {
  
  public func toolbar(_ toolbar: NSToolbar,
                      itemForItemIdentifier itemIdentifier: NSToolbarItem.Identifier,
                      willBeInsertedIntoToolbar flag: Bool) -> NSToolbarItem? {
    
    guard let item = noToolbarItems.filter({
      $0.identifier == itemIdentifier
    }).first?.toolbarItem else { return nil }
    
    item.menuFormRepresentation = menuItem(with: item.label)
    
    return item
  }
  
  public func toolbarDefaultItemIdentifiers(_ toolbar: NSToolbar)
  -> [NSToolbarItem.Identifier] {
    
    noToolbarItems.compactMap({ $0.identifier })
  }
  
  public func toolbarAllowedItemIdentifiers(_ toolbar: NSToolbar)
  -> [NSToolbarItem.Identifier] {
    
    noToolbarItems.compactMap({ $0.identifier })
  }
  
  public func toolbarSelectableItemIdentifiers(_ toolbar: NSToolbar)
  -> [NSToolbarItem.Identifier] { [] }
  
  public func toolbarWillAddItem(_ notification: Notification) { }
  public func toolbarDidRemoveItem(_ notification: Notification) { }
}

// MARK: - NSToolbarItemValidation -
extension NSToolbar: NSToolbarItemValidation {
  
  public func validateToolbarItem(_ item: NSToolbarItem) -> Bool { true }
}

// MARK: - Remove visual effects artifacts
extension NOToolbar {
  
  public func removeVisualArtifactsOverToolbar(on window: NSWindow) {
    
    DispatchQueue.main.async {
      
      NSView.removeSubViewsBy(
        view: window.standardWindowButton(.closeButton)?.superview,
        for: NSVisualEffectView.self)
    }
  }
}

extension NOToolbar {
  
  func menuItem(with title: String,
                keyEquivalent: String = .empty) -> NSMenuItem {
    
    let menuItemRep = NSMenuItem(
      title: title,
      action: #selector(toolbarMenuItemHandler(_:)),
      keyEquivalent: keyEquivalent)
    menuItemRep.target = self
    return menuItemRep
  }
  
  @objc func toolbarMenuItemHandler(_ menuItem: NSMenuItem) {
    
    menuItemCallback?(self, menuItem)
  }
}
