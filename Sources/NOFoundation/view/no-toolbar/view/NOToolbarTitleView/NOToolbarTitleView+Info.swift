//
//  NOFoundationTitleView+Info.swift
//  NOFoundation
//
//  Copyright © 2022 Kostiantyn Girych a.k.a "hcyrig". All rights reserved.
//

import AppKit

extension NOToolbarTitleView {
  
  convenience init(info: Info) {
    self.init()
    
    self.info = info
  }
  
  public struct Info {
    
    public let title: String
    public let subTitle: String
    
    public init(title: String,
                subTitle: String) {
      
      self.title = title
      self.subTitle = subTitle
    }
  }
  
  public var info: Info {
    
    set {
      
      title = newValue.title
      subTitle = newValue.subTitle
    }
    
    get {
      .init(title: title,
            subTitle: subTitle)
    }
  }
}
