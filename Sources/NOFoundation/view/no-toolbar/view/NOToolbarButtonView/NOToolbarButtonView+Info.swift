//
//  NOFoundationButtonView+Info.swift
//  NOFoundation
//
//  Copyright © 2022 Kostiantyn Girych a.k.a "hcyrig". All rights reserved.
//

import AppKit

extension NOToolbarButtonView {
  
  convenience init(info: Info,
                   identifier: String,
                   target: AnyObject?,
                   action: Selector?) {
    self.init()
    
    itemIdentifier = identifier
    
    image = NSImage(systemSymbolName: info.imageName,
                    accessibilityDescription: info.label)
    
    toolTip = info.toolTip
    
    self.action = action
    self.target = target
  }
  
  public struct Info {
    
    public let label: String
    public let paletteLabel: String
    public let toolTip: String
    public let imageName: String
    
    public init(label: String,
                paletteLabel: String,
                toolTip: String,
                imageName: String) {
      
      self.label = label
      self.paletteLabel = paletteLabel
      self.toolTip = toolTip
      self.imageName = imageName
    }
    
    public static var empty: Info {
      .init(label: .empty,
            paletteLabel: .empty,
            toolTip: .empty,
            imageName: .empty)
    }
  }
}
