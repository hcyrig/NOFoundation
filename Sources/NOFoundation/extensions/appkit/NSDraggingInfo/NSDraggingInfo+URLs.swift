//
//  NSDraggingInfo+URLs.swift
//  NOFoundation
//
//  Copyright © 2022 Kostiantyn Girych a.k.a "hcyrig". All rights reserved.
//

import AppKit

extension NSDraggingInfo {
  
  public var urls: [NSURL]? {
    draggingPasteboard
            .readObjects(
            forClasses: [NSURL.self],
            options: nil) as? [NSURL]
  }
  
  public var isRepresentingDirectories: Bool {
    
    guard let urls = self.urls else { return false }
    
    return urls.isRepresentingDirectories
  }
}
