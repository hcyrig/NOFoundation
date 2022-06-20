//
//  NSWorkspace+URLs.swift
//  NOFoundation
//
//  Copyright © 2022 Kostiantyn Girych a.k.a "hcyrig". All rights reserved.
//

import AppKit

extension NSWorkspace {
  
  public static func openUrls(_ urls: [URL]?) {
    
    guard let urls = urls,
          !urls.isEmpty else {
      return
    }
    
    urls.forEach(openURL)
  }
  
  public static func openURL(_ url: URL?) {
    
    guard let url = url else { return }
    
    openPath(url.relativePath)
  }
  
  public static func openPath(_ path: String) {
    
    NSWorkspace
      .shared
      .selectFile(nil,
                  inFileViewerRootedAtPath: path)
  }
  
  public static func openUrl(string: String) {
    
    guard let url = URL(string: string) else { return }
    
    NSWorkspace.shared.open(url)
  }
}
